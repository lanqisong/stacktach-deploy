#! /bin/bash

set -x
function find_mac_by_hostname
{
    local hostname=$1
    ping $hostname -c 3 > /dev/null 2>&1
    echo $(arp -a | grep $hostname | awk '{print $4}')
}

# Find the master db node
lb_db_mac=`find_mac_by_hostname lb-db`
for db_node in `cat /etc/hosts | grep "db[0-9]$*" | awk '{print $2}'`; do
    db_mac=`find_mac_by_hostname $db_node`
    if [ $db_mac == $lb_db_mac ]; then
        master_db=$db_node
        break
    fi
done

salt $master_db state.sls stacktach-db
salt '*api*' state.sls stacktach
salt 'api1' state.sls stacktach-worker
salt '*compute*' state.sls stacktach-compute-conf
