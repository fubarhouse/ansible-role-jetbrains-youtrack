# Ansible Role: YouTrack

[![Build Status](https://travis-ci.org/fubarhouse/ansible-role-youtrack.svg?branch=master)](https://travis-ci.org/fubarhouse/ansible-role-youtrack)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/fubarhouse/ansible-role-youtrack/master/LICENSE)

* Installs Jetbrains' YouTrack on Ubuntu servers

## Preview
![screenshot](https://raw.githubusercontent.com/fubarhouse/ansible-role-youtrack/master/images/login-screen.png)

## Role Variables

```yaml
# Version of YouTrack to use
youtrack_version: 2017.4.38399
# Installation path
youtrack_install_dir: /usr/local/youtrack
# Port to configure for use.
youtrack_port: 8114
```

## Dependencies

  None, but it requires Java to be installed properly as YouTrack is a Java application.

## Installation

  * Add the role to your playbook.
  * Modify above variables as desired.
  * Run your playbook, or `test.yml` from the tests folder.

## License

MIT / BSD

## Author Information

This role was created in 2016 by [Karl Hepworth](https://twitter.com/fubarhouse).
