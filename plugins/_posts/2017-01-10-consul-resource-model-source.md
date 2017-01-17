---
layout: plugin
title: Consul Model Source Plugin
tags: [consul]
service: ResourceModelSource
rundeck_version: 2.7+
project_url: https://github.com/jasonmcintosh/rundeck-resource-plugin
description: Gets node info from puppet dbllows for a shared set of resource pools to do semaphore locking utilizing hashicorp consul.  Sets up a limit/used set of key/values in consul, and atomically increments/decrements the used kv based upon current usage.
---

Plugin to aquire and release resources in RunDeck using Consul. Provides a shared resource semaphore mechanism.



