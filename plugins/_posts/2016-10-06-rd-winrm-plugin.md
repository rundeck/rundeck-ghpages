---
layout: plugin
title: WinRM Plugin
tags: [winrm]
rundeck_version: 2.5.2+
service: Node Executor
project_url: https://github.com/NetDocuments/rd-winrm-plugin
integration: Rundeck Plugin
description: Execute remote commands using winrm
version: 1.0.0
---

I've created  new plugin for winrm execution . 

Basic advantages versus previous one:

* Can run scripts, not only commands
* Can run PowerShell, CMD and WQL not only CMD
* Can avoid quoting problems (should be removed after core Rundeck fixes)
* Can copy files to windows


* Download URL: https://github.com/NetDocuments/rd-winrm-plugin/releases
