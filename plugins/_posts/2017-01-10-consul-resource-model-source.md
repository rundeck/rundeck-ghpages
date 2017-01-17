---
layout: plugin
title: Consul Model Source Plugin
tags: [consul]
service: ResourceModelSource
rundeck_version: 2.7+
project_url: https://github.com/jasonmcintosh/rundeck-resource-plugin
description: Two plugins to allow external resource pools utilizing consul. This allows semaphore management using consul within rundeck jobs.
---

Plugin to aquire and release resources in RunDeck using Consul. Provides a shared resource semaphore mechanism.

Use case

You need jobs to coordinate for resource availability and the ability to essentially pause all jobs until resources are available. E.g. your core data warehouse is down and you don't want jobs to run that depend upon the warehouse, set a limit to 0 for a resource and things will pause and wait for the resource to become available. 


