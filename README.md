Ansible AUTOMYSQLBACKUP ![ansible-Automysqlbackup](https://img.shields.io/badge/ansible-Automysqlbackup-fd4526.svg)
=============================================================================================================


[Overview]: #overview
[Role description]: #role-description
[Supported OS]: #supported-os
[Requirements]: #requirements
[Dependancies]: #dependancies
[Tags]: #tags
[Variables automysqlbackup]: #variables-automysqlbackup
[Change cron path]: #change-cron-path



#### Table of Contents

1. [Overview][Overview]
2. [Role description][Role description]
3. [Requirements][Requirements]
4. [Dependancies][Dependancies]
5. [Supported OS][Supported OS]
6. [Tags][Tags]
7. [Variables Automysqlbackup][Variables Automysqlbackup]
8. [Change cron path][Change cron path]



## Overview

This role manage [Automysqlbackup] 

## Role description

This role install and configure Automysqlbackup.

## Requirements

  - mysql-server

## Dependancies

None

## Supported OS

  ![Debian](https://img.shields.io/badge/Debian-Jessie|Wheezy-blue.svg)
  ![Ubuntu](https://img.shields.io/badge/Ubuntu-Trusty|xenial-blue.svg)

## Tags

Selective execution of tasks.

TAG | DESCRIPTION |EXAMPLES
  ---|---|---
  automysqlbackup | Run all tasks of this role | ```ansible-playbook playbooks/automysqlbackup.yml --tags automysqlbackup```
  automysqlbackup_install | Install automysqlbackup  | ```ansible-playbook playbooks/automysqlbackup.yml --tags automysqlbackup_install```
  automysqlbackup _config | Configure automysqlbackup  | ```ansible-playbook playbooks/automysqlbackup.yml --tags automysqlbackup_config```


## Variables Maldetect


| Variables |  Type  | Default |  Descriptions |
|---|---|---|---|---|
|automysqlbackup_dbhost | | 'localhost'
|automysqlbackup_backupdir | |  "/var/lib/automysqlbackup"
|automysqlbackup_mailcontent  | |  'quiet'
|automysqlbackup_maxattsize  | | '4000'
|automysqlbackup_mailaddr | |  'root'
|automysqlbackup_mdbnames  | |  "mysql $DBNAMES"
|automysqlbackup_dbexclude | |  ""
|automysqlbackup_create_database  | |  'yes'
|automysqlbackup_sepdir | |  'yes'
|automysqlbackup_doweekly | |  '6'
|automysqlbackup_comp | |  'gzip'
|automysqlbackup_commcomp | |  'no'
|automysqlbackup_latest | |  'no'
|automysqlbackup_max_allowed_packet | |  ""
|automysqlbackup_socket | |  ""

## Change cron path

`Exemple:`

```yaml
 automysqlbackup_cron:
     minute: "*/1"
     hour: "*"
     day: "*"
     month: "*"
     num_day: "*"
     user: "root"
     recent_day: "1"
```



