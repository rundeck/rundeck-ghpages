---
layout: plugin
title: Cloudify Plugin
tags: [cloudify]
rundeck_version: 2.5.0+
service: 
project_url: https://github.com/Antillion/rundeck-cloudify-plugin
integration: Rundeck Plugin
description: Import and run jobs, import project archives.
version: 1.0.0
---

Simple plugin that integrates with Rundeck.

The following operations are available:


<ul>
<li>Execute (and wait for) a job</li>
<li>Import a single job XMl/YAML into a project</li>
<li>Import an entire project archive into a project</li>
</ul>

Known to work with Cloudify 3.2.1 and - more or less - Rundeck versions API 11+. Rundeck calls are really forwarded off to an Antillion fork of [rundeckrun](https://github.com/antillion/arundeckrun).


