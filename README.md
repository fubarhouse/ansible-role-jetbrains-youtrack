# Ansible Role: YouTrack

[![Build Status](https://travis-ci.org/fubarhouse/fubarhouse.youtrack.svg?branch=master)](https://travis-ci.org/fubarhouse/fubarhouse.youtrack)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/fubarhouse/fubarhouse.youtrack/master/LICENSE)

* Installs Java v7 on Ubuntu servers
* Installs Jetbrains' YouTrack on Ubuntu servers

## Preview
![screenshot](https://raw.githubusercontent.com/fubarhouse/fubarhouse.youtrack/master/images/screen.png)

## Role Variables

    youtrack_domain: youtrack.vagrant.dev
    youtrack_version: 6.5.17057
    youtrack_webserver: nginx

## Dependencies

  * [geerlingguy.java](https://github.com/geerlingguy/ansible-role-java)

## Installation

  * Add the role to your playbook.
  * Execute `ansible-galaxy install geerlingguy.java`
  * Modify above variables as desired.
  * Run your playbook, or `test.yml` from the tests folder.

## License

MIT / BSD

## Author Information

This role was created in 2016 by [Karl Hepworth](https://twitter.com/fubarhouse).
