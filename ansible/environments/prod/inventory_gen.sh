#!/bin/bash
yc compute instances list | tail -n +4 | head -n -2 | grep "prod" | awk -F'|' '{print "["$3"]\n" $3 "server" "%ansible_host="$6 "%internal_ip="$7}' | tr -d '[:blank:]' | sed 's/%/ /g'  | sed 's/prod-reddit-//g' > inv.tmp
ansible-inventory -i inv.tmp --list 2> /dev/null
rm -f inv.tmp
