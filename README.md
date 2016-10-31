# Ansible Role: YouTrack

[![Build Status](https://travis-ci.org/fubarhouse/ansible-role-youtrack.svg?branch=master)](https://travis-ci.org/fubarhouse/ansible-role-youtrack)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/fubarhouse/ansible-role-youtrack/master/LICENSE)

* Installs Jetbrains' YouTrack on Ubuntu servers

## Preview
![screenshot](https://raw.githubusercontent.com/fubarhouse/ansible-role-youtrack/master/images/login-screen.png)

## Role Variables

    youtrack_domain: youtrack.vagrant.dev
    youtrack_version: 7.0.27965
    youtrack_webserver: nginx

## Dependencies

  None, but it requires Java to be installed properly as YouTrack is a Java application.

## Installation

  * Add the role to your playbook.
  * Execute `ansible-galaxy install geerlingguy.java`
  * Modify above variables as desired.
  * Run your playbook, or `test.yml` from the tests folder.

## License

MIT / BSD

## Author Information

This role was created in 2016 by [Karl Hepworth](https://twitter.com/fubarhouse).
