#!/bin/bash -x

# authorize the ArcGIS Server instance
sudo su -c "/opt/arcgis/server/tools/authorizeSoftware -f /vagrant/resources/proprietary/server.prvc -e esri@esri.com" arcgis

# use the admin api to set up the server site using the default config-store and directories locations
curl -X POST \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d 'username=admin&password=Esri380&f=json' \
  "http://localhost:6080/arcgis/admin/createNewSite"
