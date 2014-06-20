---
layout: plugin
title: PuppetDB to Rundeck Nodes
tags: [Puppet]
service: ResourceModelSource
rundeck_version: 2.0+
project_url: https://github.com/sirloper/puppetdb2-rundeck
integration: External Service
description: Use this web service to provide Puppet node data to Rundeck projects.
---

Based on the project https://github.com/martin2110/puppetdb-rundeck, modified to expose facts and add documentation.

sinatra app that glues puppetdb and rundeck together.

* Requires sinatra

* set host_uri and port in the script
