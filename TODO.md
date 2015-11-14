#TODO


Note: All setup steps or milestone should be testable (BATS)

## Now

**Objectives**: Source Management
- [ ] tester le restore
- [x] intégration des certificats letsencrypt,
   - [ ] documenter cette intégration
   - [ ] faire un playbook pour l'update des certificats
- [ ] mettre en ordre le yum update (=> fixer la version à installer)
- [ ] Enable mail notifications on GOGS (and the server)
- [ ] "traitement" des logs nginx (use GOaccess to parse and analyse the access logs)
- [ ] what happens when the server reboots, the docker containers must be restarted ?
- [ ] reorganiser le layout dir => /data au lieu de /var
- [ ] check whether the auto security update works

## Later

**Objectives**: Improve web presence
- [ ] Install and run a Static Site generator (hugo)


**Objectives**: further improve the security

- [ ] install and configure AIDE
    - [ ] enable AIDE reporting via mail
- [ ] improve log storage, consolidation and treatment
- [ ] enable OpenVPN
- [ ] if user already exist, don't reset the password

## One day....
- google analytics ?



