---
layout: plugin
title: puppet-apply-step
tags: [puppet]
rundeck_version: 2.1.1+
service: Workflow Step
project_url: https://github.com/rundeck-plugins/puppet-apply-step
integration: Rundeck Plugin
description: Executes the puppet apply command on each node matching the Job node filter.
version: 1.0.0
---

The Puppet Apply Step Plugin executes the puppet apply command on each node matching the Job node filter. The manifest file specified by the plugin is assumed to be present on the remote node.

The plugin can be configured to invoke the puppet command using sudo. Also, the plugin allows you to pass any standard options to the puppet apply command.
