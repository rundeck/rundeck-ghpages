---
layout: plugin
title: Rundeck Ansible Plugin
categories: [Ansible]
rundeck_version: 2.5+
project_url: https://github.com/Batix/rundeck-ansible-plugin
integration: Rundeck Plugin

---

This plugin brings basic Ansible support to Rundeck. It imports hosts from Ansible's inventory, including a bunch of facts, and can run modules and playbooks. There is also a node executor and file copier for your project.

No SSH-Keys need to be shared between Ansible and Rundeck, everything is run through either ansible or ansible-playbook (even the node import).

