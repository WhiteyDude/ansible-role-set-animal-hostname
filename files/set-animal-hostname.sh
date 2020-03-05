#!/bin/bash
if [ -z $1 ]; then
  prefix=""
else
  prefix="$1-"
fi

if [ -z $2 ]; then
  fqdn=".local"
else
  fqdn=".$2"
fi

#echo "Prefix is $prefix, FQDN is $fqdn"

animals_length=$(wc -l < /tmp/animals.txt)
animals_max=$((${RANDOM} % ${animals_length} + 1))
animal=$(sed -n ${animals_max}p /tmp/animals.txt | tr '[:upper:]' '[:lower:]')

adjectives_length=$(wc -l < /tmp/adjectives.txt)
adjectives_max=$((${RANDOM} % ${adjectives_length} + 1))
adjective=$(sed -n ${adjectives_max}p /tmp/adjectives.txt | tr '[:upper:]' '[:lower:]')

new_hostname="$prefix$adjective-$animal"
/bin/hostname $new_hostname
echo "127.0.0.1 $new_hostname $new_hostname$fqdn" >> /etc/hosts
sed -i -e "s/127\.0\.1\.1 ip.*/127.0.1.1 $new_hostname $new_hostname$fqdn/g" /etc/hosts
sed -i -e "s/127\.0\.0\.1 localhost/127.0.0.1 localhost $new_hostname $new_hostname$fqdn/g" /etc/hosts
echo "$new_hostname$fqdn"