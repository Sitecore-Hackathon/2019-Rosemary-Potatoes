![Hackathon Logo](documentation/images/hackathon.png?raw=true "Hackathon Logo")

# **Universal-Less** is More 

You had a tough time installing Sitecore 9, we know. SIF was new and different and it confused and angered you! But then came along a little tool called [SIF-Less](https://github.com/RAhnemann/sif-less) that made your life so much easier. 

Now a new tool shows up, Universal Tracker, and it too is new and different. But before you get confused and angry again, let us introduce you to the newest tool on the block, Universal-Less!

## But for real, what is Universal-Less?

Sitecore debuted the Universal Tracker along with the most recent update to Sitecore (9.1). Universal Tracker is a new and cool tool for collecting interaction data from any channel, including Sitecore websites, other websites, mobile applications, and just about anywhere that can run .NET or hit a RESTful web client.

It's a pretty sweet tool, but the installation process is what you might expect from a 1.0 product (i.e. it could use a little [TLC](https://www.youtube.com/watch?v=8WEtxJ4-sh4)): Powershell scripts, yes, but also several manual steps and at least one step that isn't quite clear. 

## OK cool, how do I use Universal-Less?

We're glad you asked! First things first: you'll need the package of Sitecore Universal Tracker packages from the [Sitecore downloads site](https://dev.sitecore.net/Downloads/Sitecore_Universal_Tracker/1x/Sitecore_Universal_Tracker_100.aspx) (grab the installation PDF while you're there; even though Universal-Less handles the installation process, the doc includes some valuable information about Universal Tracker). 

**This is important:** place the "Sitecore Universal Tracker 1.X.X.zip" file in a folder where the _path has no spaces_. You don't need to extract the files; Universal-Less will take care of that.

Once you have the package of packages, you'll need to make sure you have the following software products installed:

* Windows 10 or Windows Server 2016
* IIS 10. (For further information, see the [recommendation from Microsoft](https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/iis/?view=aspnetcore-2.0&amp;amp;tabs=aspnetcore2x))
* .Net 4.7.1 and later
* IIS .Net Core module [].Net Core 2.1 runtime and Hosting Bundle for Windows](https://dotnet.microsoft.com/download/dotnet-core/2.1)
* Database SQL 2016R2 or SQL 2017
* [Web Deploy version 3 or later](https://www.iis.net/downloads/microsoft/web-deploy)
* [URL Rewrite IIS module version 2.1 or later](https://www.iis.net/downloads/microsoft/url-rewrite)

Once you've got this all set, you're ready to rock with Universal-Less!

## Let's rock!

***[INSERT SITECORE PACKAGE INSTRUCTIONS HERE]***

Grab the "Universal-Less.ps1" script from the ***[LOCATION FROM ABOVE]*** and place it in the folder with the "Sitecore Universal Tracker 1.X.X.zip" file. 

Open an administrator Powershell terminal in that folder, and execute the "Universal-Less.ps1" script. You'll see a Universal-Less window appear:

![the UI](documentation/images/universal-less-ui.jpg?raw=true "The UI")

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

## Whoa whoa whoa, back up; this is on premises? What about Azure?

Azure is pretty sweet, [no doubt](https://www.youtube.com/watch?v=TR3Vdo5etCQ&t=30s), but sometimes you just want to spin up something immediately and locally without having to check to see if you have enough Azure credits to afford the necessary resources. And sometimes you'll be offline or [Azure South Central](https://www.theregister.co.uk/2018/09/17/azure_outage_report/) is blowing up again and you can't reach Azure. 

## I am very interested. Where can I learn more?

Check out our [documentation here](documentation) to learn more. 

## Sounds great! But who are you?

We're Team Rosemary Potatoes: [Chet Potvin](https://twitter.com/ChetPotvin), [Gabe Streza](https://twitter.com/GabeStreza), and [Ed Schwehm](https://twitter.com/edgesmash), coming to you from [Rightpoint](https://www.rightpoint.com). 

## Gee, I'd really like to actually see and hear from you.

Well then, check out our YouTube video all about Universal-Less!
[![Sitecore Hackathon Video Embedding Alt Text](https://img.youtube.com/vi/4VBWLeVsnBU/0.jpg)](https://www.youtube.com/watch?v=4VBWLeVsnBU)

## Why "Rosemary Potatoes"?

Rightpoint is fielding two teams this year, and we brainstormed names together. We wanted something that recognized our company but was also more whimsical than "Rightpoint Team #1". After throwing out dozens of names that share the "R-P" initials, Ed said "Rosemary Potatoes" and the team loved it. 

![Some actual rosemary potatoes](documentation/images/rosemary-potatoes.jpg?raw=true "Some actual rosemary potatoes")
