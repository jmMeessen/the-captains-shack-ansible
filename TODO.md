#TODO


Note: All setup steps or milestone should be testable (BATS)

## Sprint 3

**Objectives**: Source Management
- [x] Enable GOGS
- [ ] Force GOGS on https
- [ ] Enable mail notifications on GOGS (and the server)
- [x] Improve 404/50x messages 
- [x] SSL-isation des url externes
- [x] intégration des certificats letsencrypt,
   - [ ] documenter cette intégration
- [ ] "traitement" des logs nginx (use GOaccess to parse and analyse the access logs)
- [ ] backup/restore automatisé de Gogs
- [ ] what happens when the server reboots, the docker containers must be restarted ?

## Sprint ??

**Objectives**: Improve web presence
- [ ] enable/force HTTPS
- [ ] Install and run a Static Site generator (hugo)


**Objectives**: further improve the security

- [ ] install and configure AIDE
    - [ ] enable AIDE reporting via mail
- [ ] improve log storage, consolidation and treatment
- [ ] enable OpenVPN
- [ ] if user already exist, don't reset the password

## ideas
- google analytics ?



