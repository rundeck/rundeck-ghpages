---
layout: plugin
title: Nexus3-Rundeck
categories: [nexus]
tags: [Nexus]
service: OptionProvider
rundeck_version: 2.8+
project_url: https://github.com/nongfenqi/nexus3-rundeck-plugin
integration: External Plugin
description: This Nexus plugin turns Nexus into an <a href="http://rundeck.org/docs/manual/jobs.html#option-model-provider">Option provider</a> for Rundeck.
---

Maven repository

The plugin provides the following new HTTP resources :

* http://NEXUS_HOST/service/siesta/rundeck/maven/options/version : return a json array with the version of the matching artifacts. Parameters (all optional) 

* http://NEXUS_HOST/service/siesta/rundeck/maven/options/content : return artifact stream Parameters (all required) 

