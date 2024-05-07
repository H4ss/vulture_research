

# pré setup
# machine hote: serveur http python 8888 dans ./malware_research
#               reverse shell nc -lvnp 4444
#               ecoute sur le webhook : https://app.beeceptor.com/console/ouinonoui
#
# trouver une façon d'écouter plusieurs connection entrante sur un seul point

# résumé:
# Je télécharge ça -> important.zip et je l'unzip dans mon bureau 1
# le seeker télécharge -> vulture_executioner.sh et le met dans /tmp 2
# le seeker télécharge aussi -> vulture_poly.zip 3
# l'executioner compile et execute -> vulture_poly   4
# si l'execution est bonne, on aura un reverse shell sur ma machine 5


#
#           MACHINE1: /usr/src/desktop                  MACHINE2: /usr/src/desktop
#                       |                                    |
#                       |                                    |
#                       |                                    |
#                       |                                    |
#                       -------------------     -------------
#                                           |
#                                           |
#                                           |
#                                  VOLUME PARTAGÉ: /home/public   - exécute des scripts de sync sur le réséau
#                                  VULNÉRABILITÉ: à cause d'une mauvaise configuration de l'admin sys, éxécute tout les scripts
#                                                   dans le volume partagé
#
#
#
#




















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
