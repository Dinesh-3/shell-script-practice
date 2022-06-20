HELP:
1. ls --help
2. man ls -> To get detail documentation (man == "manual")

To get all previous commands: history
print working directory: pwd
one line per item: ls -1
crud access detail: ls -l
change name: mv name newName
create multiple file in one go: touch file1 file2 ...

VIEWING FILE
1. more file.txt (only move down)
2. less file.txt
3. head -n 5 file.txt
4. tail -n 5 file.txt

Redirection
1. cat file1.txt > file2.txt
2. cat file1.txt file2.txt
3. cat file1.txt file2.txt > combined.txt (save two file content to single file)
4. cat file.txt -n -> To add number line numbers
5. echo hello > hello.txt
6. echo You are IN $(pwd)
7. ls -l /etc > files.txt
8. <

Finding Files and directory
1. find (returns all the files inside current directory recursively)
2. find /path
3. find -type d (returns only directory)
4. find -type f (returns only files)
5. find -type f -name "f*"
6. find -type f -iname "f*" (case insensitive)
7. find / -type f -name "*.py" > python-files.txt

Chaining multiple commands
1. mkdir test;cd test ; echo done (OR one fails other runs)
2. mkdir test && cd test && echo done (AND one files other not executed)
3. mkdir test || echo "directory already exists" (if first executed second not execute)
4. ls /bin | less  (pass output of one command to other)
5. ls /bin | head

Spilt commands in multiple lines
mkdir hello;\
cd hello;\
....

Environment variables
1. printenv
2. printenv PATH (get particular variable)
3. echo $PATH (same above)
4. export DB_USER=dinesh (create env)

Write files
1. echo DB_USER=dinesh >> .bashrc (append line)
2. NOTE -> changes in .bashrc file affect in next terminal session. To overcome this issue need to use $ ps
3. source fileName To reload
4. curl -o new.mp4 https://www.url.com/file.mp4 -> to download file
5. curl  https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4 --output -

Managing Process
1. ps (to get all running process) TTY - pts is sudo terminal
2. sleep 3 (in seconds)
3. sleep 30 & (put this process in background. To check use $ ps)
4. kill 38 (kill process using PID process id)
5. & -> Add & at the end to run the server in background
6. ps aux | grep java -> To get all running java application

Managing Users:
1. useradd -m userName (create new user)
2. cat /etc/passwd
3. usermod -s /bin/bash test (modify user shell script)
4. cat /etc/shadow (user password stored in hash format)
5. userdel test (delete user)
6. adduser userName (interactive session to create user)
7. sudo -i (to change root user )
8. su {username} (to change specific user)
9. mkdir /app && chown app:app /app (create directory and assign to the differrent user )
10. whoami
11. 
Managing Groups
1. groupadd developers
2. usermod -G developers test (add user to supplementary group)
3. groups test (get all groups of an user)

File Permission
1. ls -l
drwxrwxr-x :
   1- First letter d means directory , - means file
   2- next are 3 groups devided into 3 parts in this demo rwx      rwx r-x (read write execute) FIRST Group (Permission to the     user owns the file) SECOND Group (permission have groups that owns the file) THIRD Group (permission for everyone else)
-rw-rw-rw- 1 dinesh dinesh 65536 Sep 15 13:58 unsortedNumbers.csv
In this 65536 is a file size in bytes
2. echo echo hello > script.sh
3. ./script.sh (execute this sh file)
4. chmod u+x script.sh (add execute permission to this user we can also use g for GROUP and o for OTHER)
5. chmod u-x script.sh (remove permission to the user)
6. chmod u-rw script.sh (add or remove one or more permissions)
7. chmod o+x script.sh (anyone can exceute)
8. chmod og+x+w-r script.sh *.sh (we can do many more)

Set Domain name in Ubuntu
1. sudo nano /etc/hosts
2. 

Memory and Disk Size
1. free -> Shows Ram usage statistics in KB 
2. free -g -> Get Result in GB other options (-b, -k, -m) 
3. free -h -> Get Human readable output
4. free --help -> To get available options
5. df -> Get Disk space

Networking:
1. netstat -> To get all running ports and sockets
2. sudo ss -tunelp -> To get Ports

remove terminal last word: ctrl + w
remove file using pattern: rm *.txt
Get Bash Path: echo $0

Folder:
1. nautilus . -> to open current folder in files app
2. xdg-open . -> open current folder terminal not wait for close
3. sudo rm -rf folder_path -> Forcefully delete Folder

Package:
1. apt list --upgradable -> To list available update
2. apt-get update
3. 

SSH:
1. ssh-keygen -> Generate ssh key
2. cat /var/log/auth.log -> To get authorized keys logged session details
3. ls /var/log -> view all app logs