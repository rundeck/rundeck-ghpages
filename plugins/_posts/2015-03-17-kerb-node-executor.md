---
layout: plugin
title: Kerberos executor plugin
tags: [kerberos,ssh]
rundeck_version: 2.4.0+
service: Node Executor
project_url: https://github.com/cernops/rundeck-exec-kerberos/
integration: Rundeck Plugin
description: Execute remote commands using Kerberos authentication.
version: 1.0.0
---

Hello,

I have written a plugin to execute remote commands using Kerberos authentication in our environment. It is basically a wrapper around SSH that does a 'kinit -kt mykeytab myuser' before executing the command.
The plugin can be configured with the path of a keytab and the user that will be authenticated using the keytab.  

Project URL: https://github.com/cernops/rundeck-exec-kerberos/
Download URL: https://github.com/cernops/rundeck-exec-kerberos/raw/master/ssh-krb-node-executor-plugin.zip
