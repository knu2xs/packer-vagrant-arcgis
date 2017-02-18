#!/bin/bash -x

# Install Tomcat
sudo apt-get install -y tomcat7 tomcat7-docs tomcat7-admin authbind
sudo apt-get clean

# stop the Tomcat service to make configuration changes
sudo /etc/init.d/tomcat7 stop

# reference: http://askubuntu.com/questions/371809/run-tomcat7-as-tomcat7-or-any-other-user
# run tomcat under arcgis user to avoid permissions issues when registering sites wit the web adaptor
sudo sed -e's/TOMCAT7_USER=tomcat7/TOMCAT7_USER=arcgis/' -i /etc/default/tomcat7

# change the owner of the log file location to arcgis
sudo chown -R arcgis:adm /var/log/tomcat7

# change the owner of the tomcat folder to arcgis
sudo chown -R arcgis:tomcat7 /var/lib/tomcat7/webapps

# add vagrant and arcgis to useful groups for accessing resources
sudo usermod -a -G adm arcgis
sudo usermod -a -G adm vagrant
sudo usermod -a -G tomcat7 arcgis
sudo usermod -a -G tomcat7 vagrant

# reference: http://stackoverflow.com/questions/4756039/how-to-change-the-port-of-tomcat-from-8080-to-80
# edit Tomcat settings to run on port 80 and 443 instead of 8080 and 8443
sudo sed -e 's/port="8080"/port="80"/' -i /var/lib/tomcat7/conf/server.xml
sudo sed -e 's/port="8443"/port="443"/' -i /var/lib/tomcat7/conf/server.xml

# modify tomcat7 config to allow authbind
sudo sed -e 's/#AUTHBIND=no/AUTHBIND=yes/' -i /etc/default/tomcat7

# set up authbind to work with tomcat
sudo touch /etc/authbind/byport/80
sudo chmod 500 /etc/authbind/byport/80
sudo chown arcgis /etc/authbind/byport/80
sudo touch /etc/authbind/byport/443
sudo chmod 500 /etc/authbind/byport/443
sudo chown arcgis /etc/authbind/byport/443

# start tomcat
sudo /etc/init.d/tomcat7 start

# list all running services reference $ ps -ef

# extract the Web Adaptor installation resources to the temp directory
tar -zxvf /tmp/ArcGIS_Web_Adaptor*.tar.gz -C /tmp

# run the install
sudo su -c "/tmp/WebAdaptor/Setup -m silent -l yes -d /opt/arcgis -v" arcgis