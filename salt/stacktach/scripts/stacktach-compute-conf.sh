#! /bin/bash

# Change nova-compute configuration
nova_conf=/etc/nova/nova.conf
openstack-config $nova_conf DEFAULT notification_driver messaging
openstack-config $nova_conf DEFAULT notification_topics monitor
openstack-config $nova_conf DEFAULT notify_on_state_change vm_and_task_state  
service nova-compute restart
