#!/bin/bash -x

# Install Tomcat
sudo apt-get install -y tomcat7 tomcat7-docs tomcat7-admin authbind
sudo apt-get clean

# reference: http://stackoverflow.com/questions/4756039/how-to-change-the-port-of-tomcat-from-8080-to-80
# edit Tomcat settings to run on port 80 and 443 instead of 8080 and 8443
sudo sed -e 's/port="8080"/port="80"/' -i /var/lib/tomcat7/conf/server.xml
sudo sed -e 's/port="8443"/port="443"/' -i /var/lib/tomcat7/conf/server.xml

# modify tomcat7 config to allow authbind
sudo sed -e 's/#AUTHBIND=no/AUTHBIND=yes/' -i /etc/default/tomcat7

# set up authbind to work with tomcat
sudo touch /etc/authbind/byport/80
sudo chmod 500 /etc/authbind/byport/80
sudo chown tomcat7 /etc/authbind/byport/80

# restart tomcat
sudo /etc/init.d/tomcat7 restart

# extract the Web Adaptor installation resources to the temp directory
tar -zxvf /tmp/ArcGIS_Web_Adaptor*.tar.gz -C /tmp

# run the install
sudo su -c "/tmp/WebAdaptor/Setup -m silent -l yes -d /opt/arcgis -v" arcgis