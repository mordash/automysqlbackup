Ansible AUTOMYSQLBACKUP ![ansible-Automysqlbackup](https://img.shields.io/badge/ansible-Automysqlbackup-fd4526.svg)
=============================================================================================================

## Role description

This role installs and configure Automysqlbackup.

## Requirements

  - mysql-server || mariadb-server

## Dependencies

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

### Configuration
| Variables |  Types  | Default |  Descriptions |
|---|---|---|---|
| automysqlbackup_mysql_dump_username |  str  | 'root' | Username to access the MySQL server |
| automysqlbackup_mysql_dump_password |  str  | "\`grep password /root/.automysqlbackup.cnf \| awk '{print $2}'\`" | Password to access the MySQL server<br />Clear text in the conf ! |
| automysqlbackup_mysql_dump_passfile |  str  | '/root/automysqlbackup.cnf' | To create a more secure file containing the password<br />Require {{ mysql_user_dump_password }} |
| mysql_user_backup_password |  str  | UNDEFINED | MySQL users' password to put in the passfile<br />Put this one in a vault ! |
| automysqlbackup_mysql_dump_host |  str  | 'localhost' | Host name (or IP address) of MySQL server |
| automysqlbackup_mysql_dump_host_friendly |  str  | UNDEFINED | "Friendly" host name of MySQL server to be used in email log  |
| automysqlbackup_backup_dir |  str  | "/var/lib/automysqlbackup" | Backup directory location |
| automysqlbackup_multicore |  bool  | UNDEFINED | This is practically a moot point, since there is a fallback to the compression functions without multicore support in the case that the multicore versions aren't present in the system |
| automysqlbackup_multicore_threads |  int  | UNDEFINED | Number of threads (= occupied cores) you want to use |
| automysqlbackup_db_names |  str  |  "()"  | Databases to backup (empty = all) |
| automysqlbackup_db_month_names |  str  |  UNDEFINED | List of databases for Monthly Backups |
| automysqlbackup_db_exclude |  str  | "( 'performance_schema' 'accounts' 'information_schema' )" | List of DBNAMES to EXCLUDE if DBNAMES is empty |
| automysqlbackup_table_exclude |  str  | UNDEFINED | List of tables to exclude, in the form db_name.table_name |
| automysqlbackup_do_monthly |  int  | UNDEFINED | Which day do you want monthly backups? |
| automysqlbackup_do_weekly |  int  | UNDEFINED | Which day do you want weekly backups? (1 to 7 where 1 is Monday) |
| automysqlbackup_rotation_daily |  int  | UNDEFINED | Set rotation of daily backups. VALUE*24hours |
| automysqlbackup_rotation_weekly |  int  | UNDEFINED | Set rotation for weekly backups. VALUE*24hours |
| automysqlbackup_rotation_monthly |  int  | UNDEFINED | Set rotation for monthly backups. VALUE*24hours |
| automysqlbackup_mysql_dump_port |  int  | UNDEFINED | Set the port for the mysql connection |
| automysqlbackup_mysql_dump_commcomp |  bool  | UNDEFINED | Compress communications between backup server and MySQL server? |
| automysqlbackup_mysql_dump_usessl |  bool  | UNDEFINED | Use ssl encryption with mysqldump? |
| automysqlbackup_mysql_dump_socket |  str  | UNDEFINED | For connections to localhost. Sometimes the Unix socket file must be specified |
| automysqlbackup_mysql_dump_max_allowed_packet |  str  | UNDEFINED | The maximum size of the buffer for client/server communication. e.g. 16MB (maximum is 1GB) |
| automysqlbackup_mysql_dump_single_transaction |  bool  | UNDEFINED | This option sends a START TRANSACTION SQL statement to the server before dumping data |
| automysqlbackup_mysql_dump_master_data |  bool  | UNDEFINED | Use this option to dump a master replication server to produce a dump file that can be used to set up another server as a slave of the master |
| automysqlbackup_mysql_dump_full_schema |  bool  | UNDEFINED |  |
| automysqlbackup_mysql_dump_dbstatus |  bool  | UNDEFINED | Backup status of table(s) in textfile |
| automysqlbackup_mysql_dump_create_database |  bool  | UNDEFINED | Include CREATE DATABASE in backup? |
| automysqlbackup_mysql_dump_use_separate_dirs |  bool  | UNDEFINED | Separate backup directory and file for each DB? (yes or no) |
| automysqlbackup_mysql_dump_compression |  str  | UNDEFINED | Choose Compression type. (gzip or bzip2) |
| automysqlbackup_mysql_dump_latest |  bool  | UNDEFINED | Store an additional copy of the latest backup to a standard location so it can be downloaded by third party scripts |
| automysqlbackup_mysql_dump_latest_clean_filenames |  bool  | UNDEFINED | Remove all date and time information from the filenames in the latest folder |
| automysqlbackup_mysql_dump_differential |  bool  | UNDEFINED | Create differential backups |
| automysqlbackup_mail_mailcontent |  str  | UNDEFINED | Mail setup: log, files, sdtout or quiet  |
| automysqlbackup_mail_maxattsize |  int  | UNDEFINED | Set the maximum allowed email size in k |
| automysqlbackup_mail_splitandtar |  bool  | UNDEFINED | Allow packing of files with tar and splitting it in pieces of CONFIG_mail_maxattsize. |
| automysqlbackup_mail_use_uuencoded_attachments |  bool  | UNDEFINED | Use uuencode instead of mutt. WARNING: Not all email clients work well with uuencoded attachments. |
| automysqlbackup_mail_address |  str  | UNDEFINED | Mail address to send a mail to (user@domain.com) |
| automysqlbackup_encrypt |  bool  | UNDEFINED | Backup encryption using OpenSSL |
| automysqlbackup_encrypt_password |  str  | UNDEFINED | Choose a password to encrypt the backups |
| automysqlbackup_backup_local_files |  str  | UNDEFINED | Backup local files |
| automysqlbackup_prebackup |  str  | UNDEFINED | Command to run before backups |
| automysqlbackup_postbackup |  str  | UNDEFINED | Command run after backups |
| automysqlbackup_umask |  int  | UNDEFINED | umask |

### Installation
| Variables |  Types  | Default |  Descriptions |
|---|---|---|---|
| automysqlbackup_install_url |  str  | 'http://downloads.sourceforge.net/project/automysqlbackup/AutoMySQLBackup/{{ automysqlbackup_url_path_version }}' | Install link |
| automysqlbackup_url_path_version |  str  | 'AutoMySQLBackup%20VER%203.0' | Install links' version | 
| automysqlbackup_version |  str  | 'v3.0_rc6' | Automysqlbackups' version | 
| automysqlbackup_url |  str  | '{{ automysqlbackup_install_url }}/automysqlbackup-{{ automysqlbackup_version }}.tar.gz' | Full install URL |
| automysqlbackup_tar_dest_dir |  str  | "/tmp" | Where to download automysqlbackup | 
| automysqlbackup_dest_dir |  str  | "/opt/automysqlbackup" | Where to install automysqlbackup | 
| automysqlbackup_conf_dir |  str  | "/etc/automysqlbackup" | Where to put automysqlbackups' conf  | 
| automysqlbackup_conf_name |  str  | "myserver" | Name of the conf | 

### Cron
| Variables |  Type  | Default |  Descriptions |
|---|---|---|---|
| automysqlbackup_cron_minute |  int  | 0 | cron exec min | 
| automysqlbackup_cron_hour |  int  | 1 | cron exec hour | 
| automysqlbackup_cron_day |  int  | '*' | cron exec day | 
| automysqlbackup_cron_month |  int  | '*' | cron exec month | 
| automysqlbackup_cron_num_day |  int  | '*' | cron exec num day | 
| automysqlbackup_cron_user |  str  | 'root' | cron user | 
