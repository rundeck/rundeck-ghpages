---
layout: plugin
title: Chef Nodes
tags: [Chef]
service: ResourceModelSource
rundeck_version: 2.6+
project_url: https://github.com/atheiman/better-chef-rundeck
integration: External Service
description: Use this web service to provide Chef node data to Rundeck projects.  
---

A Sinatra app for integrating Chef and Rundeck - a Chef search query is sent as an HTTP GET request to the app at the path /<key>:<search_term> and the app will query the Chef server and return the nodes and their attributes in a format suitable for a Rundeck project's resource model source.


