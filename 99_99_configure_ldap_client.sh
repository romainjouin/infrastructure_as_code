sudo sed -i 's/\(passwd.*\)\(compat\)/\1 ldap \2/' /etc/nsswitch.conf
sudo sed -i 's/\(group.*\)\(compat\)/\1 ldap \2/' /etc/nsswitch.conf
sudo sed -i 's/\(shadow.*\)\(compat\)/\1 ldap \2/' /etc/nsswitch.conf

