#! /bin/bash

# Change openstack configuration and restart services
for conf in nova/nova.conf glance/glance-api.conf cinder/cinder.conf keystone/keystone.conf neutron/neutron.conf heat/heat.conf; do
    openstack-config /etc/$conf DEFAULT notification_driver messaging
    openstack-config /etc/$conf DEFAULT notification_topics monitor
done

openstack-config /etc/nova/nova.conf DEFAULT notify_on_state_change vm_and_task_state
openstack-config /etc/keystone/keystone.conf oslo_messaging_rabbit rabbit_hosts rabbit1:5672,rabbit2:5672,rabbit3:5672
openstack-config /etc/keystone/keystone.conf oslo_messaging_rabbit rabbit_userid openstack 
openstack-config /etc/keystone/keystone.conf oslo_messaging_rabbit rabbit_password {{ pillar['rabbit_pass'] }} 
openstack-config /etc/keystone/keystone.conf oslo_messaging_rabbit rabbit_ha_queues True 

for svr in nova-api nova-conductor nova-scheduler glance-api cinder-api neutron-server heat-api apache2; do
    service $svr restart;
done
