---
layout: plugin
title: Fluentd Plugin
tags: [logging,fluentd]
rundeck_version: 1.6.0+
service: StreamingLogWriter
project_url: https://github.com/inokappa/rundeck-fluentd-plugin
integration: Rundeck Plugin
description: This is a simple Rundeck streaming Log Writer plugin that will pipe all log output to a Fluentd.
version: 1.0.0
---

The plugin supports these configuration properties:

<ul>
<li>host - hostname of the Fluentd.(ex: 127.0.0.1)</li>
<li>port - TCP port of the Fluentd.(ex: 24224)</li>
<li>tag_prefix - Tag Prefix of the Fluentd.(ex: rundeck.log)</li>
</ul>
