# Documentation

## Summary

**Category:** Best use of xConnect and/or *Universal Tracker*

We fairly quickly decided we would be using Universal Tracker for our Hackathon submission and dove right into learning all about Universal Tracker. We discovered two things:

1. Universal Tracker is pretty awesome.
1. The documentation for Universal Tracker is not nearly as awesome.

Our first ideas involved using the Universal Tracker to connect all sorts of things to xConnect: Roku devices, Raspberry Pis, Androids, iPhones, you know it. But as we worked into the night, we struggled to get even a basic Hello World for Universal Tracker working. The process included various gotchas (e.g. certificate thumbprints that must be upper case) and manual steps (e.g. updating hosts file). 

That's when innovation struck.

We realized that, just like with SIF and SIF-Less, there was a huge opportunity for helping the greater Sitecore developer community access and learn Universal Tracker by automating the process of getting a local Universal Tracker installation up and running. And so, Universal-Less was born (apologies, [Rob](http://www.rockpapersitecore.com/), for blatantly ripping off your name).

## Pre-requisites

Universal-Less has no additional requirements beyond those of Universal Tracker:

* Sitecore 9.1 installation
* Windows 10 or Windows Server 2016
* IIS 10. (For further information, see the [recommendation from Microsoft](https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/iis/?view=aspnetcore-2.0&amp;amp;tabs=aspnetcore2x))
* .Net 4.7.1 and later
* IIS .Net Core module [].Net Core 2.1 runtime and Hosting Bundle for Windows](https://dotnet.microsoft.com/download/dotnet-core/2.1)
* Database SQL 2016R2 or SQL 2017
* [Web Deploy version 3 or later](https://www.iis.net/downloads/microsoft/web-deploy)
* [URL Rewrite IIS module version 2.1 or later](https://www.iis.net/downloads/microsoft/url-rewrite)

## Installation

Universal-Less takes the form of a Powershell script and is installed via a Sitecore package

1. Use the Sitecore Installation wizard to install the [Universal-Less package](#link-to-package)
2. Grab the "Universal-Less.ps1" and "Universal-Less-Uninstall.ps1" scripts from the [DIRECTORY]. 
3. Profit!

### Why not Sitecore Powershell?

Universal-Less needs to update IIS, create Windows services, read the certificate store, and install files into new websites, all tasks that cannot be completed in Sitecore Powershell. As awesome as SPE is (and it truly is awesome), we needed to stick to standard Powershell for Universal-Less.

## Configuration

Universal-Less requires no configuration beyond the simple UI that appears when running the script:

![the UI](images/universal-less-ui.jpg?raw=true "The UI")

## Usage

You can use Universal-Less as described on the main readme and repeated here:

Install the [RosyTaters-UniversalLess-1.0.zip](https://github.com/Sitecore-Hackathon/2019-Rosemary-Potatoes/blob/master/sc.package/RosyTaters-UniversalLess-1.0.zip) package into your Sitecore solution.

Grab the `Universal-Less.ps1` script from the App_Data of your site and place it in the folder with the `Sitecore Universal Tracker 1.X.X.zip` file. 

Open an administrator Powershell terminal in that folder, and execute the `Universal-Less.ps1` script. You'll see a Universal-Less window appear:

![the UI](images/universal-less-ui.jpg?raw=true "The UI")

Fill in the fields:

* SQL Server Name: the name of your local SQL server (e.g. ESCHWEHM-810340\EDS_2017DEV)
* SQL User: a SQL user that has permissions to create databases and tables
* SQL Password: password to the above account
* Universal Tracker Database Name: A name for the new database that will be created for Universal Tracker
* xConnect Instance Name: the name of your local xConnect instance (if you installed SC9.1 the proper way using SIF and/or SIF-Less, the instance name and the domain name will be the same. Universal-Less relies on this.)
* Prefix: a name to uniquely identify this installation of Universal Tracker
* License File Path: the path to your Sitecore license file 
* Root Websites Path: the path to where you want the Collection and Processing services to be installed. 

Then click "Install Universal Tracker". The Powershell script will open other Powershell script windows. Do not close those windows; they are doing Very Important Things. 

## Video

Here is our video explaining Universal-Less: 

[![Sitecore Hackathon Video Embedding Alt Text](https://img.youtube.com/vi/yH9YM9RLFr4/0.jpg)](https://youtu.be/yH9YM9RLFr4)