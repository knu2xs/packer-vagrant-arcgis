#!/bin/bash -x

# copy the Web Adaptor WAR to be used in Tomcat for server at the ./server url
sudo cp /opt/arcgis/webadaptor10.5/java/arcgis.war /var/lib/tomcat7/webapps/server.war

# configure the Web Adaptor with the local installation of ArcGIS Server
sudo su -c "/opt/arcgis/webadaptor10.5/java/tools/configurewebadaptor.sh -m server -w http://$HOSTNAME/server/webadaptor -g http://$HOSTNAME:6080 -u admin -p Esri380 -a true" arcgis
#sudo su -c "/opt/arcgis/webadaptor10.5/java/tools/configurewebadaptor.sh -m server -w http://kog-vm-win10/server/webadaptor -g http://kog-vm-win10:6080 -u admin -p Esri380 -a true" arcgis
#sudo su -c "/opt/arcgis/webadaptor10.5/java/tools/configurewebadaptor.sh -m server -w http://localhost/server/webadaptor -g http://localhost:6080 -u admin -p Esri380 -a true" arcgis