# SQL Injection


# SQL Injection
- Further on today, we will be using THM
- If you haven't registered go to [tryhackme.com](https://tryhackme.com)
- Ensure you have the [VPN file](https://tryhackme.com/access) or AttackBox ready

## SQL
Structured Query Language (SQL) is used to communicate with databases and has the capability to delete, edit, insert or retrieve data. There are a few variations of SQL which have some slight syntactical differences. A few examples are MySQL, SQL Server and SQLite.

{{< admonition type=question open=true >}}
Can you think where databases are used on the web?
{{< /admonition >}}

## SQL Example
What will this do?

```sql
SELECT * FROM Customers WHERE Firstname="Jack";
```

{{< admonition type=tip title="Answer" open=false >}}
It will search the table customers and will return all the people with the first name "Jack".
{{< /admonition >}}

## Injection Attacks
An injection attack is where a user can trick a server to run a command, via vectors such as an input, header or URL. It is currently in the third position of the [OWASP Top 10](https://owasp.org/Top10/).

The main cause of an injection attack is down to improper user input sanitisation and or validation.

{{< admonition type=note open=false >}}
This does not only include SQL injection, other forms include:
    - XSS
    - OS Command Injection
{{< /admonition >}}

## SQL Injections
SQL injection, sometimes shortened to SQLi, is where you are able to insert commands that are able to effect or retrieve information from databases. It is regularly found on dynamic sites; with WordPress plugins being frequently affected (see [CVE-2022-25607](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-25607) for an example).

{{< admonition type=info open=true >}}
[Akamai](https://www.darkreading.com/attacks-breaches/sql-injection-attacks-represent-two-third-of-all-web-app-attacks) observed, between 2017-2019, 65.1% of attacks on web applications used SQLi.
{{< /admonition >}}

## A Bad Demo
Can you spot/exploit the flaw?

```py
user=input("Enter Username: ")
password=input("Enter Password: ")
sql = 'SELECT * FROM users WHERE user=="'+user+'"AND password=="'+password+'";'
print("SQL Command Sent: ", sql, "\n")
cursor.execute(sql)
user=cursor.fetchall()
```

{{< admonition type=tip title="How To" open=false >}}
" OR 1=1; --
```py
'SELECT * FROM users WHERE user=="'+user+'"AND password=="'+ password+'";'
```
Becomes:
```sql
SELECT * FROM user WHERE user=="Jack" AND password=="" OR 1=1; --";
```

The command ends the string then compares 1 with 1 (which equals true) and "--" comments out the rest of the statement. In this case, the whole table would be printed.
{{< /admonition >}}

## Can you secure it?
- Research ways that you can secure the program and implement it.

{{< admonition type=tip title="How To" open=false >}}
- Input validation
- Use ? placeholder
- Use the fetchone method - this does not secure it, but makes exploitation much easier
{{< /admonition >}}

## How am I meant to remember the commands?
Thankfully you can use a tool named SQLmap, here is a useful [SQLmap Cheatsheet](https://thedarksource.com/sqlmap-cheat-sheet/).

It is also possible to pair with Burpsuite, to save having specify location. To do this, intercept the request, then save it to a file and use the following command:

```sh
sqlmap -r filename
```

## If it is that easy...
If it is that easy, why is it so common? Well, many applications are written in PHP which didn't originally contain a SQL validation method. This has meant that many have ignored it. The main problem now is that many insecure code examples exist on code forums/sites.

Another factor is the use of content management systems. This is because if the underlying system is affected, every website using that platform will be vulnerable. However, this can be a benefit, as it will mean that the code only needs to be updated in one place.

## More Advanced SQLi
- **Time-based/Blind** - Sometimes you cannot see the output, therefore, you can use timers to show your answer.
- **Boolean** - It is possible to infer the content inside a database using boolean operators, such as changing the order the way data is displayed to the user based depending on whether a comparison is true.

## NoSQL, no problem?
- Some people believe that no-SQL is injection free, but this is false.
- NoSQL stands for non-relational SQL.
- Although the syntax is different it is still exploitable.
- [Cheat Sheet](https://book.hacktricks.xyz/pentesting-web/nosql-injection).

## Prevent SQLi
- Switch to a static site, like Hugo.
    - but you lose some functionality (e.g. forms).
    - Not as beginner friendly.
- If you use a CMS, install the bare-minimum of plugins (and only ones from trusted sources).
- Pentest the site!

## Today's Task
- Use THM search function and complete:
    - [sqlilab](https://tryhackme.com/room/sqlilab)
    - [sqlinjectionlm](https://tryhackme.com/room/sqlinjectionlm)
    - [dailybugle](https://tryhackme.com/room/dailybugle)
    - (organised in terms of difficulty)
- ask below if you have any questions.

