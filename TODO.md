#TODO


Note: All setup steps or milestone should be testable (BATS)

## Now

**Objectives**: Source Management
- [ ] reorganiser le layout dir => /data au lieu de /var
- [ ] automatiser le backup et l'archivage
- [ ] nettoyer les documentations (compléter et supprimer les obsolètes)
   - [ ] documenter le backup 
   - [ ] documenter l'intégration de letsencrypt
- [x] tester le restore
- [x] intégration des certificats letsencrypt,
   - [ ] faire un playbook pour l'update des certificats
   - [ ] comment se fait la mise à jour du client
- [ ] mettre en ordre le yum update (=> fixer la version à installer)
- [ ] Enable mail notifications on GOGS (and the server)
- [ ] "traitement" des logs nginx (use GOaccess to parse and analyse the access logs)
- [ ] what happens when the server reboots, the docker containers must be restarted ?
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



