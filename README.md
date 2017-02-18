#Packer Vagrant ArcGIS

This repository provides _most_ of the resources needed to build a VirtualBox box file to use in conjunction with Vagrant to _relatively_ quickly build, license and configure a basic installation of ArcGIS Enterprise. If you know a lot about these technologies, and think there is a better way to do something, fork this repo, fix it, and send me a pull request. I am just figuring this out as I go, and welcome the help.

##Why?

Setting up an environment for ArcGIS Enterprise technology no longer is simply a matter of installing ArcGIS Server, and calling it a day. Just for a basic base Web GIS configuration on one instance, the process involves installing Server, Portal, Web Adapter and the Data Store, setting up the Web Adaptor with Server and Portal, and federating Server and Portal. True, I skipped a few steps in there, but I had to leave them out. The sentence was getting too long! Reading the sentence is bad enough. Doing it is even worse.
 
According to [Wikipedia, Infrastructure as Code (IaC)](https://en.wikipedia.org/wiki/Infrastructure_as_Code) enables, "modelling infrastructure with code, and then having the ability to design, implement, and deploy applications infrastructure with known software best practices." The solution to this problem, streamlining the process of setting up an ArcGIS Enterprise Web GIS, is to utilize Infrastructure as Code tools, specifically Packer and Vagrant.
 
[Packer](https://www.packer.io/) and [Vagrant](https://www.vagrantup.com/) are IaC tools for creating machine images, and provisioning (configuring) software on these machine images. Packer uses a JSON configuration file to build a machine image. Vagrant is then used to further configure the machine image for use. In this way, code - a script, is used to ensure consistency between builds along with comparatively easy repeatability.
 
##Setup Prerequsites
 
First, __ensure Packer, Vagrant and VirtualBox are all installed__ on your host machine. While you are at it, you may as well make your life easier and istall Vagrant Manager as well. If you are on a Mac, the easiest way is to first install [Homebrew](https://brew.sh/). Next, just open a Terminal and use these commands.
```
$ brew install packer
$ brew cask install vagrant
$ brew cask install virtualbox
$ brew cask install vagrant-manager
```
If you are using Windows, there is a great manual on SitePoint, [Getting Started with Vagrant on Windows](https://www.sitepoint.com/getting-started-vagrant-windows/), detailing how to set up the same environment on Windows.

Next, __get the installation resources you need from Esri__. Put them in `resources/proprietary`, and rename them. As earlier stated, this repository contains _most_ of the resources needed to create a basic configuration of ArcGIS Enterprise. It does _not_ contain the proprietary resources from Esri, the installation files and license files. To use this repository, you need to procure these yourself, place them in the `resources/proprietary` directory with a specific naming convention. There is a README inside the directory detailing how to do this. It is not outrageously hard.
 
##Packer Build
 
From here, things get a little easier. Still, this step is a little time consuming. On my 2012 MacBook Pro, it took just under 33 minutes, so get comfortable. In terminal, navigate to where ever you saved this repo. In my case, I saved it in a directory named `dev` in my home directory.
```
$ cd ~/dev/packer-vagrant-arcgis
```
Now, go ahead and build the image. This _does_ require an internet connection, and the faster the better. You are going to be downloading a whole boatload of packages to ensure the operating system is up-to-date. 
```
$ packer build ubuntu-16.04-amd64-arcgis-server-standalone.json
```
Once this is done, and it admittedly takes a while, now we are almost ready to start using it with Vagrant. We have one more step before we have an instance to play with, though.  

## Vagrant Box Add

Nice work, we now have a box file to use. However, to use it we need to add it to Vagrant. The [`vagrant box add`](https://www.vagrantup.com/docs/cli/box.html#add) command will copy the box to our user profile, making it available for our various Vagrant projects. Think of it sort of like adding it to your Vagrant library.
```
$ vagrant box add arcgis-server-standalone file://<path to your created box file> 
```
In my case, I have everything in my user profile directory under the `dev` directory, so when I added my new box file, the command looked like this.
```
$ vagrant box add arcgis-server-standalone file://~/dev/packer-vagrant-arcgis/builds/ubuntu-16.04-arcgis-server-standalone.virtualbox.box
```
With this added, now we are ready to use Vagrant to build an instance to start playing with.

## Vagrant Configurations

__Under construction...__