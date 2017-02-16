#!/bin/bash -x

# copy the Web Adaptor WAR to be used in Tomcat for server at the ./server url
sudo cp /opt/arcgis/webadaptor10.5/java/arcgis.war /var/lib/tomcat7/webapps/server.war

# configure the Web Adaptor with the local installation of ArcGIS Server
sudo su -c "/opt/arcgis/webadaptor10.5/java/tools/configurewebadaptor.sh -m server -w http://vagrant/server/webadaptor -g http://vagrant:6080 -u admin -p Esri380 -a true" arcgis