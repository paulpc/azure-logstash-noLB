# Create a load balanced logstash 'cluster' in Azure #
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fpaulpc%2Fazure-logstash-noLB%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fpaulpc%2Fazure-logstash-noLB%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template allows you to create n Virtual Machines in an availability set and install logstash on them.

*** if you're eventing over the public internet to ElasticSearch, don't event clear text ***

SSH access to the machines should happen from a jump server (which is why you get to use a pub key). There should be no need for a public IP, as the purpose of this is to get info from a broker like Kafka and push it into ES.

This template also deploys a Storage Account, Virtual Network, Availability Set, and Network Interfaces.

The script will prepares the machines with openjdk, logstash 5.6.x and deploy the default configuration file that takes the abovementioned log sources and pushes them to kafka. For this reason, make sure you are deploying to a VNET with Kafka access. I am using the `[fields][logsource]` property for defining the log source, but you are welcome to use another. For beats, i set it in the beats config file, for JSON, in the source system, and then for the syslog stuff i have to use separate ports to differentiate and then append the property.

