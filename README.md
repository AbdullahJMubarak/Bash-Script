# Backup Script  
## Overview
 The script copies directory from one path and copy it to another one and if the files of the path modified, The script will copy these modified files with the name of current date in the format of YYYY-MM-DD-hh-mm-ss and the script will be terminated after 30s . 
## Perprequisits to run this script
- U  should install linux OS or one on a virtual machine
- U should make sure that you turn on the execution premission
- you should pass four  parameters to it `Source_directory` `Backup_directory` `interval-secs` `max-backups`



## Procedure to run the script  
 ### Running the Backup Script only 
1-Change the mode to be executable
2- execute the script following by four arguments
```sh
chmod +x backup.sh
./backup.sh Source_directory Backup_directory interval-secs max-backups
```
### Running the script using Makefile
There are some variable we should assign the arguments to it before we execute the Makefile 
| Variable name | its argument |
| ------ | ------ |
| DIR | Source_directory |
| BDIR | Backup_directory |
| SECS | interval-secs |
| MAXBUPS | max-backups |
 - If you passed four arguments the file will copy from the source to destination 
```sh
make Source_directory Backup_directory interval-secs max-backups
```
- If you passed the the Source directory only so the destonation will be folder with the name of "c" in the same path of the script
```sh
make Source_directory Backup_directory interval-secs max-backups
```
## Cron job
### Every minute
If you want to run the program every minute so th should type this arguments in `crontab`.
```sh
corntab -e
* * * * * /bin/bash /home/abdullah/Desktop/lab1/backup.sh ./a ./b 6 3 
```
### Every 3rd friday of the month 
```sh
* * 1 * * VAR=$(cal | nawk 'NR==4{if($6>7){fri=$6+7}else{fri=$6+14}}END{print fri}')
31 0 $VAR * * /bin/bash /home/abdullah/Desktop/lab1/backup.sh ./a ./b 6 3

```


