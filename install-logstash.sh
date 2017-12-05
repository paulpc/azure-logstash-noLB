#/bin/bash

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-5.x.list

# installing logstash
sudo apt-get update
sudo apt-get install openjdk-8-jre-headless openjdk-8-jdk-headless logstash

# getting the template
curl https://raw.githubusercontent.com/paulpc/azure-logstash-noLB/master/output-logstash.conf | sudo tee /etc/logstash/conf.d/logstash_template.conf