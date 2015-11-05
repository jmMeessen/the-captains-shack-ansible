#TODO


Note: All setup steps or milestone should be testable (BATS)

## Sprint 3

**Objectives**: Source Management
- [ ] backup/restore automatisé de Gogs
- [x] intégration des certificats letsencrypt,
   - [ ] documenter cette intégration
   - [ ] faire un playbook pour l'update des certificats
- [ ] mettre en ordre le yum update (à exécuter uniquement lors de l'installation initiale)
- [ ] Enable mail notifications on GOGS (and the server)
- [ ] "traitement" des logs nginx (use GOaccess to parse and analyse the access logs)
- [ ] what happens when the server reboots, the docker containers must be restarted ?
- [x] Enable GOGS
- [x] Force GOGS on https
- [x] Improve 404/50x messages 
- [x] SSL-isation des url externes

## Sprint ??

**Objectives**: Improve web presence
- [x] enable/force HTTPS
- [ ] Install and run a Static Site generator (hugo)


**Objectives**: further improve the security

- [ ] install and configure AIDE
    - [ ] enable AIDE reporting via mail
- [ ] improve log storage, consolidation and treatment
- [ ] enable OpenVPN
- [ ] if user already exist, don't reset the password

## ideas
- google analytics ?



