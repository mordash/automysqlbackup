Ansible AUTOMYSQLBACKUP ![ansible-Automysqlbackup](https://img.shields.io/badge/ansible-Automysqlbackup-fd4526.svg)
=============================================================================================================

## Role description

This role install and configure Automysqlbackup.

## Requirements

  - mysql-server || mariadb-server

## Dependancies

None

## Supported OS

  ![Debian](https://img.shields.io/badge/Debian-Tested-green.svg)
  ![Ubuntu](https://img.shields.io/badge/Ubuntu-Tested-green.svg)
  ![Centos7](https://img.shields.io/badge/RedHat-untested-yellow.svg)

## Tags

Selective execution of tasks.

TAG | DESCRIPTION |EXAMPLES
  ---|---|---
  automysqlbackup | Run all tasks of this role | ```ansible-playbook playbooks/automysqlbackup.yml --tags automysqlbackup```
  automysqlbackup_install | Install automysqlbackup  | ```ansible-playbook playbooks/automysqlbackup.yml --tags automysqlbackup_install```
  automysqlbackup_config | Configure automysqlbackup  | ```ansible-playbook playbooks/automysqlbackup.yml --tags automysqlbackup_config```
  automysqlbackup_cron | Configure cron task  | ```ansible-playbook playbooks/automysqlbackup.yml --tags automysqlbackup_cron```

## Variables

| Variables |  Type  | Default |  Descriptions |
|---|---|---|---|
|automysqlbackup_mysql_dump_username | STRING | 'root' |  Username to access the MySQL server   |
|automysqlbackup_mysql_dump_password | STRING  | "\`grep password /root/.automysqlbackup.cnf \| awk '{print $2}'\`" | Password to access the MySQL server\ Clear text in the conf !   |
|automysqlbackup_mysql_dump_passfile | STRING  | '/root/automysqlbackup.cnf' | To create a more secure file containing the password\ Require {{ mysql_user_dump_password }}   |
|mysql_user_backup_password | STRING  |  | MySQL user's password to put in the passfile\ Put this one in a vault !   |
|automysqlbackup_mysql_dump_host| STRING  | 'localhost' | Host name (or IP address) of MySQL server  | 
|automysqlbackup_mysql_dump_host_friendly| STRING  | UNDEFINED | "Friendly" host name of MySQL server to be used in email log  | 
|automysqlbackup_backup_dir | STRING  | "/var/lib/automysqlbackup" |Backup directory location   | 
|automysqlbackup_multicore | BOOLEAN | UNDEFINED | This is practically a moot point, since there is a fallback to the compression functions without multicore support in the case that the multicore versions aren't present in the system.   | 
|automysqlbackup_multicore_threads | NUMBER | UNDEFINED | Number of threads (= occupied cores) you want to use  | 
|automysqlbackup_db_names | STRING  | "()" | Databases to backup (empty = all)  | 
|automysqlbackup_db_month_names | STRING  |  UNDEFINED | List of databases for Monthly Backups  | 
|automysqlbackup_db_exclude | STRING  | "( 'performance_schema' 'accounts' 'information_schema' )" |   | List of DBNAMES to EXCLUDE if DBNAMES is empty
|automysqlbackup_table_exclude | STRING  | UNDEFINED | List of tables to exclude, in the form db_name.table_name  | 
|automysqlbackup_do_monthly | NUMBER | UNDEFINED | Which day do you want monthly backups?   | 
|automysqlbackup_do_weekly | NUMBER |  UNDEFINED | Which day do you want weekly backups? (1 to 7 where 1 is Monday)  | 
|automysqlbackup_rotation_daily | NUMBER |  UNDEFINED | Set rotation of daily backups. VALUE*24hours  | 
|automysqlbackup_rotation_weekly | NUMBER |  UNDEFINED |  Set rotation for weekly backups. VALUE*24hours  | 
|automysqlbackup_rotation_monthly | NUMBER |UNDEFINED |  Set rotation for monthly backups. VALUE*24hours  | 
|automysqlbackup_mysql_dump_port | NUMBER | UNDEFINED | Set the port for the mysql connection  | 
|automysqlbackup_mysql_dump_commcomp | BOOLEAN |UNDEFINED | Compress communications between backup server and MySQL server? |  
|automysqlbackup_mysql_dump_usessl | BOOLEAN |UNDEFINED | Use ssl encryption with mysqldump?  | 
|automysqlbackup_mysql_dump_socket | |UNDEFINED | For connections to localhost. Sometimes the Unix socket file must be specified.  | 
|automysqlbackup_mysql_dump_max_allowed_packet | | UNDEFINED | The maximum size of the buffer for client/server communication. e.g. 16MB (maximum is 1GB)  | 
|automysqlbackup_mysql_dump_single_transaction | BOOLEAN | UNDEFINED |  This option sends a START TRANSACTION SQL statement to the server before dumping data  | 
|automysqlbackup_mysql_dump_master_data | | UNDEFINED |Use this option to dump a master replication server to produce a dump file that can be used to set up another server as a slave of the master.   | 
|automysqlbackup_mysql_dump_full_schema | BOOLEAN | UNDEFINED |   | 
|automysqlbackup_mysql_dump_dbstatus  | BOOLEAN | UNDEFINED |Backup status of table(s) in textfile.    | 
|automysqlbackup_mysql_dump_create_database  | BOOLEAN  | UNDEFINED |Include CREATE DATABASE in backup?   | 
|automysqlbackup_mysql_dump_use_separate_dirs | BOOLEAN | UNDEFINED |  Separate backup directory and file for each DB? (yes or no)  | 
|automysqlbackup_mysql_dump_compression | STRING | UNDEFINED | Choose Compression type. (gzip or bzip2)  | 
|automysqlbackup_mysql_dump_latest| BOOLEAN | UNDEFINED | Store an additional copy of the latest backup to a standard location so it can be downloaded by third party scripts.  | 
|automysqlbackup_mysql_dump_latest_clean_filenames| BOOLEAN | UNDEFINED |  Remove all date and time information from the filenames in the latest folder. | 
|automysqlbackup_mysql_dump_differential| BOOLEAN | UNDEFINED | Create differential backups.   | 
|automysqlbackup_mail_mailcontent | STRING | UNDEFINED | Mail setup: log, files, sdtout or quiet  | 
|automysqlbackup_mail_maxattsize| NUMBER | UNDEFINED | Set the maximum allowed email size in k  | 
|automysqlbackup_mail_splitandtar| BOOLEAN | UNDEFINED | Allow packing of files with tar and splitting it in pieces of CONFIG_mail_maxattsize.  | 
|automysqlbackup_mail_use_uuencoded_attachments | BOOLEAN | UNDEFINED | Use uuencode instead of mutt. WARNING: Not all email clients work well with uuencoded attachments.  | 
|automysqlbackup_mail_address | STRING | UNDEFINED | mail Address to send mail to? (user@domain.com)  | 
|automysqlbackup_encrypt | BOOLEAN | UNDEFINED | Do you wish to encrypt your backups using openssl?  | 
|automysqlbackup_encrypt_password | STRING | UNDEFINED | Choose a password to encrypt the backups.   | 
|automysqlbackup_backup_local_files  | STRING | UNDEFINED |   Backup local files | 
|automysqlbackup_prebackup | STRING | UNDEFINED | Command to run before backups  | 
|automysqlbackup_postbackup | STRING | UNDEFINED | Command run after backups  | 
|automysqlbackup_umask | NUMBER | UNDEFINED | umask  | 
|automysqlbackup_cron_minute | NUMBER | 0 | cron exec min  | 
|automysqlbackup_cron_hour | NUMBER | 1 | cron exec hour  | 
|automysqlbackup_cron_day | NUMBER | '*' | cron exec day  | 
|automysqlbackup_cron_month | NUMBER | '*' | cron exec month  | 
|automysqlbackup_cron_num_day | NUMBER | '*' | cron exec num day  | 
|automysqlbackup_cron_user | STRING | 'root' | cron user  | 
|automysqlbackup_cron_name | STRING | 'myserver' | cron task name  | 
