# Module 4: Task 2

## Tests

```bash
$ ./db.sh list
1  admin1,admin
2  guest1,guest
3  guest2,guest
4  subscriber1,subscriber
5  subscriber2,subscriber
6  subscriber3,subscriber

$ ./db.sh restore
Backup is restored from /Users/Aliaksandr_Varachai/projects/devops-fundamental-courses/devops-courses/module_4/task_2/data/2023-03-13-22-24-24-users.db.backup

$ ./db.sh list
1  admin1,admin
2  guest1,guest
3  guest2,guest
4  subscriber1,subscriber
5  subscriber2,subscriber
6  subscriber3,subscriber
7  Alex,admin
8  Mettew,guest
9  John,subscriber
10  Boris,clown

$ ./db.sh add
Username: John
Role: clown
John,clown is saved

$ ./db.sh list reverse
1  admin1,admin
2  guest1,guest
3  guest2,guest
4  subscriber1,subscriber
5  subscriber2,subscriber
6  subscriber3,subscriber
7  Alex,admin
8  Mettew,guest
9  John,subscriber
10  Boris,clown
11  John,clown

$ ./db.sh backup
Backup is created

$ ./db.sh
Manages users in a database
Syntax: db.sh [command] [optionalParam]
List of available commands:
add      Adds a user to DB
backup   Create a backup of users' DB
find     Finds a user info in DB
list     Displays the full list of users. If [optionalParam=reverse], in reverse order
```
