# mcollective-rabbitmq

This module configures mcollective server and client components to use a rabbitmq broker.

An mcollective vhost must be declaired manually on the rabbitmq server:

```
rabbitmqadmin declare vhost name=/mcollective

rabbitmqadmin declare user name=mcollective password=changeme tags=
rabbitmqadmin declare permission vhost=/mcollective user=mcollective configure='.*' write='.*' read='.*'

rabbitmqadmin declare user name=admin password=changeme tags=administrator
rabbitmqadmin declare permission vhost=/mcollective user=admin configure='.*' write='.*' read='.*'
```

Taken from: https://docs.puppetlabs.com/mcollective/reference/plugins/connector_rabbitmq.html#configuring-rabbitmq
