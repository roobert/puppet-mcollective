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

RMQ_CMD="rabbitmqadmin -u guest -p guest -s --ssl-key-file=/etc/rabbitmq/ssl/key.pem  --ssl-cert-file=/etc/rabbitmq/ssl/cert.pem -P 5671"

$RMQ_CMD declare vhost name=/mcollective

$RMQ_CMD declare user name=mcollective password=changeme tags=
$RMQ_CMD declare permission vhost=/mcollective user=mcollective configure='.*' write='.*' read='.*'

$RMQ_CMD declare user name=admin password=changeme tags=administrator
$RMQ_CMD declare permission vhost=/mcollective user=admin configure='.*' write='.*' read='.*'

for collective in mcollective ; do
  $RMQ_CMD declare exchange --vhost=/mcollective name=${collective}_broadcast type=topic
  $RMQ_CMD declare exchange --user=admin --password=changeme --vhost=/mcollective name=${collective}_directed type=direct
done
```

Taken from: https://docs.puppetlabs.com/mcollective/reference/plugins/connector_rabbitmq.html#configuring-rabbitmq
