#!/bin/bash -x

# ensure jq is installed
sudo apt-get install -y jq

# reference: http://stackoverflow.com/questions/1955505/parsing-json-with-unix-tools
# get a an administration token
token=$(curl -X POST -k \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=admin&password=Esri380&client=referer&referer=$HOSTNAME&f=json" \
  "https://localhost:6443/arcgis/admin/generateToken" | jq -r '.token')

# delete the world cities service
curl -X POST -k \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "token=$token&f=json&" \
  "https://localhost:6443/arcgis/admin/services/SampleWorldCities.MapServer/delete"
