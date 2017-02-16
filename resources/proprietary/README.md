# Proprietary Resources

For both the Packer and Vagrant to be able to function, a number of resources need to be placed in this location following a very specific convention. There need to be, at a minimum, five resources in here for the scripts to function. These include:
- ArcGIS_Portal_Linux.tar.gz
- ArcGIS_Server_Linux.tar.gz
- ArcGIS_Web_Adaptor_Java.tar.gz
- portal.prvc
- server.prvc

These files need to be located here with these exact names. The scripts find these files with these names to use.