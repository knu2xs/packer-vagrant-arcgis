#!/bin/bash -x

# authorize the ArcGIS Server instance
/opt/arcgis/server/tools/authorizeSoftware -f /vagrant/resources/proprietary/server.prvc -e esri@esri.com

# use the admin api to set up the server site using the default config-store and directories locations
curl -X POST \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d 'username=admin&password=Esri380&f=json' \
  "http://localhost:6080/arcgis/admin/createNewSite"

# ensure jq is installed
sudo apt-get install -y jq

# reference: http://stackoverflow.com/questions/1955505/parsing-json-with-unix-tools
# get a an administration token
#curl -s 'https://vagrant:6443/admin/authenticate' | jq -r '.token'

# delete the world cities service