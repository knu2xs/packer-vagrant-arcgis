# Packer Vagrant ArcGIS

This repository provides _most_ of the resources needed to build a VirtualBox box file to use in conjunction with Vagrant to _relatively_ quickly build, license and configure a basic installation of ArcGIS Enterprise. If you know a lot about these technologies, and think there is a better way to do something, fork this repo, fix it, and send me a pull request. I am just figuring this out as I go, and welcome the help.

## Why?
Setting up an environment for ArcGIS Enterprise technology no longer is simply a matter of installing ArcGIS Server, and calling it a day. Just for a basic base Web GIS configuration on one instance, the process involves installing Server, Portal, Web Adapter and the Data Store, setting up the Web Adaptor with Server and Portal, and federating Server and Portal. True, I skipped a few steps in there, but I had to leave them out. The sentence was getting too long! Reading the sentence is bad enough. Doing it is even worse.
 
 The solution to this problem, streamlining the process of setting up an ArcGIS Enterprise Web GIS, is to utilize Infrastructure as Code tools, specifically Packer and Vagrant. According to [Wikipedia, Infrastructure as Code (IaC)](https://en.wikipedia.org/wiki/Infrastructure_as_Code) enables, "modelling infrastructure with code, and then having the ability to design, implement, and deploy applications infrastructure with known software best practices."
 
 [Packer](https://www.packer.io/) and [Vagrant](https://www.vagrantup.com/) are IaC tools for creating machine images, and provisioning (configuring) software on these machine images. Packer uses a JSON configuration file to build a machine image. Vagrant is then used to further configure the machine image for use. In this way, code - a script, is used to ensure consistency between builds along with comparatively easy repeatability.
 
 ## Setup Prerequsites
 First, __ensure Packer, Vagrant and VirtualBox are all installed__ on your host machine. While you are at it, you may as well make your life easier and istall Vagrant Manager as well. If you are on a Mac, the easiest way is to first install [Homebrew](https://brew.sh/). Next, just open a Terminal and use these commands.
```
$ brew install packer
$ brew cask install vagrant
$ brew cask install virtualbox
$ brew cask install vagrant-manager
```
 
 Next, __get the installation resources you need from Esri__. Put them in `resources/proprietary`, and rename them. As earlier stated, this repository contains _most_ of the resources needed to create a basic configuration of ArcGIS Enterprise. It does _not_ contain the proprietary resources from Esri, the installation files and license files. To use this repository, you need to procure these yourself, place them in the `resources/proprietary` directory with a specific naming convention. There is a README inside the directory detailing how to do this. It is not outrageously hard.
 
 ## Packer Build
 From here, things get a little easier. Still, this step is a little time consuming. In terminal, navigate to where ever you saved this repo. In my case, I saved it in a directory named `dev` in my home directory.
 ```
 $ cd ~/tmp/packer-vagrant-arcgis
 ```
 
 Now, go ahead and build the image. This _does_ require an internet connection, and the faster the better. You are going to be downloading a whole boatload of packages to ensure the operating system is up-to-date. 
```
$ packer build ubuntu-16.04-amd64.json
```

__This is as far as I have made it in building this process...__