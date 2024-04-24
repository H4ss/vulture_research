# Project Research Environment Setup

This guide outlines the setup of a Docker-based "malware" research environment, featuring Ubuntu 18.04. This environment facilitates the study of malware behavior and network vulnerabilities in a controlled and isolated setting.

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
