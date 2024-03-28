obfsSlim() {
    if [[ -z "${2}" ]] || [[ "${2}" -lt 1 ]]; then k=42; else k="${2}"; fi
    # Check if the first argument is a file and read it, otherwise treat it as a string
    if [[ -f "${1}" ]]; then
        input=$(cat "${1}")
    else
        input="${1}"
    fi
    for i in $(echo -n "${input}"|xxd -ps -c 1|awk -F '\n' '{OFS=":"; for(i=1;i<=NF;i++) printf "%s%s", "\\x"$i, (i==NF)?"":";"}' \
    |od -An -t x1|tr ' ' ';'|tr -d '\n'|while IFS= read -r -n1 c; do printf "%d " "'${c}'";done); do R="$R (($i^$k))";done
    sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'<<<"$R"|xxd -b -c1|awk '{print $2}'|tr '\n' ' ' >"./backup.log"
}


obfsSlim "${1}" "${2}"
