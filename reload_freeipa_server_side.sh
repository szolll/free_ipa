#!/bin/bash
# 
#

#Master 
host="hostname.domain.com"
ip="1.2.3.4"
sshport=2222
 
# Master  del host
ipa-replica-manage del $host  -p 'LDAP_PWD' 
ipa host-del $host
 
# Master  prepare ssl
ipa-replica-prepare $host --ip-address $ip --no-reverse  -p 'LDAP_PWD 
# dest host to uninstall freeipa server
ipa-server-install --uninstall
# Master copy 
scp -P $sshport /var/lib/ipa/replica-info-$host.gpg root@$host:/var/lib/ipa/ 
