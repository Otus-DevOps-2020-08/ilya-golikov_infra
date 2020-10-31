#!/bin/bash
yc compute instances list | tail -n +4 | head -n -2 | awk -F'|' '{print "["$3"_group]\n" $3 "%ansible_host="$6}' | tr -d '[:blank:]' | sed 's/%/ /g'  | sed 's/-/_/g' > inv.tmp
ansible-inventory -i inv.tmp --list 2> /dev/null
rm -f inv.tmp
