#!/bin/bash

#sysctl -w vm.max_map_count=262144

echo "Starting docker compose..."
docker-compose up -d
echo "Waiting for Elasticsearch availability";
until curl -s --cacert certs/ca/ca.crt https://localhost:9200 | grep -q "missing authentication credentials"; do sleep 30; done;

echo "Setting kibana_system password";
until curl -s -X POST --cacert certs/ca/ca.crt -u "elastic:elastic" -H "Content-Type: application/json" https://localhost:9200/_security/user/kibana_system/_password -d '{"password":"elastic"}' | grep -q "^{}"; do sleep 10; done;

until curl -s -X POST --cacert certs/ca/ca.crt -u "elastic:elastic" -H "Content-Type: application/json" https://localhost:9200/_security/user/kibana_system/_password -d '{"password":"elastic"}'; do sleep 10; done;

echo "All done!"