---
layout: plugin
title: Jenkins-Rundeck
tags: [Jenkins]
service: 
rundeck_version: 1.3+
project_url: https://wiki.jenkins-ci.org/display/JENKINS/RunDeck+Plugin
integration: External Plugin
description: Let your jenkins builds trigger rundeck jobs (and vice versa).
---

This plugin is a Notifier that will talk to a RunDeck instance (via its HTTP API) to schedule a job execution on RunDeck after a successful build on Jenkins. It is also a Trigger that will schedule a build on Jenkins after a job execution on RunDeck (using RunDeck WebHook Notification). In addition, it turns Jenkins into an <a href="http://rundeck.org/docs/RunDeck-Guide.html#option-model-provider">Option provider</a> for RunDeck, if you want to use your Jenkins build artifacts as an option to a RunDeck job.

