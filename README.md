# Project Research Environment Setup

This guide outlines the setup of a Docker-based "malware" research environment, featuring Ubuntu 18.04 containers equipped with network scanning tools such as nmap. This environment facilitates the study of malware behavior and network vulnerabilities in a controlled and isolated setting.

# Prerequisites

- Launch the prestart.sh script

- docker network inspect vulture_net

- make sure that the subnet displayed is the same as the subnet in the setup-iptables.sh in /config (ex: 172.19.0.0/16). If not change it.

- docker-compose up --build -d

- docker-compose exec ubuntu1 bash / docker-compose exec ubuntu2 bash

on both machine :

launch the ./setup-iptables.sh in the root to setup the firewall
NOTES:

-> Now the machines can ping each other but not the outside world

if you want to test it :

- ping google.com should NOT succeed
- ping ubuntu2 (if you are on ubuntu1) should succeed

TODO:

- Replication mechanism (vulnerability, regular chron file sharing, network scanning from the malware prototype ...)

- A simple morphism mechanism from the malware prototype depending on an event (when it is copied, shifted from a place to another, executed, debugged ...)

charcode obfs

;;;;;;;;;;;5c;;78;;32;;33;;5c;;78;;36;;39;;5c;;78;;36;;65;;5c;;78;;36;;33;;;;;;;;;;;5c;;78;;36;;63;;5c;;78;;37;;35;;5c;;78;;36;;34;;5c;;78;;36;;35;;;;;;;;;;;5c;;78;;32;;30;;5c;;78;;33;;63;;5c;;78;;37;;33;;5c;;78;;37;;34;;;;;;;;;;;5c;;78;;36;;34;;5c;;78;;36;;39;;5c;;78;;36;;66;;5c;;78;;32;;65;;;;;;;;;;;5c;;78;;36;;38;;5c;;78;;33;;65;;5c;;78;;30;;61;;5c;;78;;37;;36;;;;;;;;;;;5c;;78;;36;;66;;5c;;78;;36;;39;;5c;;78;;36;;34;;5c;;78;;32;;30;;;;;;;;;;;5c;;78;;36;;64;;5c;;78;;36;;31;;5c;;78;;36;;39;;5c;;78;;36;;65;;;;;;;;;;;5c;;78;;32;;38;;5c;;78;;32;;39;;5c;;78;;32;;30;;5c;;78;;37;;62;;;;;;;;;;;5c;;78;;32;;30;;5c;;78;;37;;30;;5c;;78;;37;;32;;5c;;78;;36;;39;;;;;;;;;;;5c;;78;;36;;65;;5c;;78;;37;;34;;5c;;78;;36;;36;;5c;;78;;32;;38;;;;;;;;;;;5c;;78;;32;;32;;5c;;78;;36;;38;;5c;;78;;36;;35;;5c;;78;;37;;39;;;;;;;;;;;5c;;78;;37;;39;;5c;;78;;37;;39;;5c;;78;;35;;63;;5c;;78;;36;;65;;;;;;;;;;;5c;;78;;32;;32;;5c;;78;;32;;39;;5c;;78;;33;;62;;5c;;78;;32;;30;;;;;;;;;;;5c;;78;;37;;64;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

charcode deobfs

;;;;;;;;;;;5c;;78;;32;;33;;5c;;78;;36;;39;;5c;;78;;36;;65;;5c;;78;;36;;33;;;;;;;;;;;5c;;78;;36;;63;;5c;;78;;37;;35;;5c;;78;;36;;34;;5c;;78;;36;;35;;;;;;;;;;;5c;;78;;32;;30;;5c;;78;;33;;63;;5c;;78;;37;;33;;5c;;78;;37;;34;;;;;;;;;;;5c;;78;;36;;34;;5c;;78;;36;;39;;5c;;78;;36;;66;;5c;;78;;32;;65;;;;;;;;;;;5c;;78;;36;;38;;5c;;78;;33;;65;;5c;;78;;30;;61;;5c;;78;;37;;36;;;;;;;;;;;5c;;78;;36;;66;;5c;;78;;36;;39;;5c;;78;;36;;34;;5c;;78;;32;;30;;;;;;;;;;;5c;;78;;36;;64;;5c;;78;;36;;31;;5c;;78;;36;;39;;5c;;78;;36;;65;;;;;;;;;;;5c;;78;;32;;38;;5c;;78;;32;;39;;5c;;78;;32;;30;;5c;;78;;37;;62;;;;;;;;;;;5c;;78;;32;;30;;5c;;78;;37;;30;;5c;;78;;37;;32;;5c;;78;;36;;39;;;;;;;;;;;5c;;78;;36;;65;;5c;;78;;37;;34;;5c;;78;;36;;36;;5c;;78;;32;;38;;;;;;;;;;;5c;;78;;32;;32;;5c;;78;;36;;38;;5c;;78;;36;;35;;5c;;78;;37;;39;;;;;;;;;;;5c;;78;;37;;39;;5c;;78;;37;;39;;5c;;78;;35;;63;;5c;;78;;36;;65;;;;;;;;;;;5c;;78;;32;;32;;5c;;78;;32;;39;;5c;;78;;33;;62;;5c;;78;;32;;30;;;;;;;;;;;5c;;78;;37;;64;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
