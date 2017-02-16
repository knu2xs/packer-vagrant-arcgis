#!/bin/bash -x

# make a directory for the Portal resources
mkdir /tmp/ArcGISPortal

# extract the installation resources from the vagrant directory
tar -zxvf /tmp/ArcGIS_Portal*.tar.gz -C /tmp/ArcGISPortal

# install ArcGIS Server as the arcgis user
sudo su -c "/tmp/ArcGISPortal/Setup -m silent -l yes -d /opt -v" arcgis

# clean out the installation resources
rm -rf /tmp/ArcGISPortal

# copy the startup file to the init.d directory so ArcGIS Server will know how to start with the instance boot
sudo cp /opt/arcgis/portal/framework/arcgisportal /etc/init.d/

# use sed to edit the arcgisserver init.d file so it knows where to find the installtion of server
sudo sed -e 's/\/arcgis\/portal/\/opt\/arcgis\/portal/' -i /etc/init.d/arcgisportal

# set ArcGIS Server to start with the instance boot
sudo /lib/systemd/systemd-sysv-install enable arcgisportal