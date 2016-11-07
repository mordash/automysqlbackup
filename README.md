Ansible AUTOMYSQLBACKUP ![ansible-Automysqlbackup](https://img.shields.io/badge/ansible-Automysqlbackup-fd4526.svg)
=============================================================================================================


[Overview]: #overview
[Role description]: #role-description
[Supported OS]: #supported-os
[Requirements]: #requirements
[Dependancies]: #dependancies
[Tags]: #tags
[Variables automysqlbackup for Debian/Ubuntu]: #variables-automysqlbackup-for-debian/dbuntu
[Variables automysqlbackup for RedHat]: #variables-automysqlbackup-for-redhat
[Change cron path]: #change-cron-path



#### Table of Contents

1. [Overview][Overview]
2. [Role description][Role description]
3. [Requirements][Requirements]
4. [Dependancies][Dependancies]
5. [Supported OS][Supported OS]
6. [Tags][Tags]
7. [Variables automysqlbackup for Debian/Ubuntu][Variables automysqlbackup for Debian/Ubuntu]
8. [Variables automysqlbackup for RedHat][Variables automysqlbackup for RedHat]
9. [Change cron path][Change cron path]



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
  ![Centos7](https://img.shields.io/badge/RedHat-Centos7-blue.svg)

## Tags

Selective execution of tasks.

TAG | DESCRIPTION |EXAMPLES
  ---|---|---
  automysqlbackup | Run all tasks of this role | ```ansible-playbook playbooks/automysqlbackup.yml --tags automysqlbackup```
  automysqlbackup_install | Install automysqlbackup  | ```ansible-playbook playbooks/automysqlbackup.yml --tags automysqlbackup_install```
  automysqlbackup_config | Configure automysqlbackup  | ```ansible-playbook playbooks/automysqlbackup.yml --tags automysqlbackup_config```
  automysqlbackup_cron | Configure cron task  | ```ansible-playbook playbooks/automysqlbackup.yml --tags automysqlbackup_cron```


## Variables Automysqlbackup for Debian/Ubuntu


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
|automysqlbackup_routines |  |
|automysqlbackup_prebackup | |  UNDEFINED |  
|automysqlbackup_postbackup | | UNDEFINED |  


## Variables Automysqlbackup for RedHat 


| Variables |  Type  | Default |  Descriptions |
|---|---|---|---|---|
|automysqlbackup_mysql_dump_username | STRING | UNDEFINED |  
|automysqlbackup_mysql_dump_password | STRING  | UNDEFINED |   
|automysqlbackup_mysql_dump_host| STRING  |  UNDEFINED |  
|automysqlbackup_mysql_dump_host_friendly| STRING  | UNDEFINED |  
|automysqlbackup_backup_dir | STRING  |  UNDEFINED |  
|automysqlbackup_multicore | BOOLEAN | UNDEFINED |  
|automysqlbackup_multicore_threads | NUMBER | UNDEFINED |  
|automysqlbackup_db_names | STRING  | UNDEFINED |  
|automysqlbackup_db_month_names | STRING   |  UNDEFINED |  
|automysqlbackup_db_exclude | STRING  |  UNDEFINED |  
|automysqlbackup_table_exclude | STRING  |  UNDEFINED |  
|automysqlbackup_do_monthly | NUMBER | UNDEFINED |  
|automysqlbackup_do_weekly | NUMBER |  UNDEFINED |  
|automysqlbackup_rotation_daily | NUMBER |  UNDEFINED |  
|automysqlbackup_rotation_weekly | NUMBER |  UNDEFINED |  
|automysqlbackup_rotation_monthly | NUMBER |UNDEFINED |  
|automysqlbackup_mysql_dump_port | NUMBER | UNDEFINED |  
|automysqlbackup_mysql_dump_commcomp | BOOLEAN |UNDEFINED |  
|automysqlbackup_mysql_dump_usessl | BOOLEAN |UNDEFINED |  
|automysqlbackup_mysql_dump_socket | |UNDEFINED |  
|automysqlbackup_mysql_dump_max_allowed_packet | | UNDEFINED |  
|automysqlbackup_mysql_dump_single_transaction | BOOLEAN | UNDEFINED |  
|automysqlbackup_mysql_dump_master_data | | UNDEFINED |  
|automysqlbackup_mysql_dump_full_schema | BOOLEAN | UNDEFINED |  
|automysqlbackup_mysql_dump_dbstatus  | BOOLEAN | UNDEFINED |  
|automysqlbackup_mysql_dump_create_database  | BOOLEAN  | UNDEFINED |  
|automysqlbackup_mysql_dump_use_separate_dirs | BOOLEAN | UNDEFINED |  
|automysqlbackup_mysql_dump_compression | STRING | UNDEFINED |  
|automysqlbackup_mysql_dump_latest| BOOLEAN | UNDEFINED |  
|automysqlbackup_mysql_dump_latest_clean_filenames| BOOLEAN | UNDEFINED |  
|automysqlbackup_mysql_dump_differential| BOOLEAN | UNDEFINED |  
|automysqlbackup_mail_mailcontent | STRING | UNDEFINED |  
|automysqlbackup_mail_maxattsize| NUMBER | UNDEFINED |  
|automysqlbackup_mail_splitandtar| BOOLEAN | UNDEFINED |  
|automysqlbackup_mail_use_uuencoded_attachments | BOOLEAN | UNDEFINED |  
|automysqlbackup_mail_address | STRING | UNDEFINED |  
|automysqlbackup_encrypt | BOOLEAN | UNDEFINED |  
|automysqlbackup_encrypt_password | STRING | UNDEFINED |  
|automysqlbackup_backup_local_files  | STRING | UNDEFINED |  
|automysqlbackup_prebackup | STRING | UNDEFINED |  
|automysqlbackup_postbackup | STRING | UNDEFINED |  
|automysqlbackup_umask | NUMBER | UNDEFINED |  
|automysqlbackup_dryrun| NUMBER | UNDEFINED |  


## Change cron path

`Exemple:`

```yaml
automysqlbackup_cron:
  - path: '/etc/automysqlbackup/myserver.conf'
    minute: "*/1"
    hour: "*"
    day: "*"
    month: "*"
    num_day: "*"
    user: 'root
```



