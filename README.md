# mcollective-rabbitmq

This module configures mcollective server and client components to use a rabbitmq broker.

An mcollective vhost must be declaired manually on the rabbitmq server:

```
# enable STOMP plugin
rabbitmq-plugins enable rabbitmq_stomp

# install rabbitmqadmin tool (https://www.rabbitmq.com/management.html)
rabbitmq-plugins enable rabbitmq_management
wget https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/rabbitmq_v3_6_0/bin/rabbitmqadmin -O /usr/local/bin/rabbitmqadmin
chmod +x /usr/local/bin/rabbitmqadmin

MCOLLECTIVE_PASSWORD="574g3mc0cl13nt,,"
ADMIN_PASSWORD="574gasjkdhasd,,"

rabbitmqadmin declare vhost name=/mcollective

rabbitmqadmin declare user name=mcollective password=${MCOLLECTIVE_PASSWORD} tags=
rabbitmqadmin declare permission vhost=/mcollective user=mcollective configure='.*' write='.*' read='.*'

rabbitmqadmin declare user name=admin password=${ADMIN_PASSWORD} tags=administrator
rabbitmqadmin declare permission vhost=/mcollective user=admin configure='.*' write='.*' read='.*'

for collective in mcollective ; do
  rabbitmqadmin declare exchange --user=admin --password=${ADMIN_PASSWORD} --vhost=/mcollective name=${collective}_broadcast type=topic
  rabbitmqadmin declare exchange --user=admin --password=${ADMIN_PASSWORD} --vhost=/mcollective name=${collective}_directed type=direct
done
```

Taken from: https://docs.puppetlabs.com/mcollective/reference/plugins/connector_rabbitmq.html#configuring-rabbitmq
