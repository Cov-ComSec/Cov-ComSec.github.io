# Reverse Engineering Basics


The session at ComSec this week went into some basic reverse engineering methods. Ben did a demo with some challenges, and then we released some CTF challenges to solve.


## Credential Leak via Memory Inspection

The first demo showed how we can use a decompiler to understand how a binary functions, and then use a debugger to inspect memory at runtime in order to find credentials. You can download the demo binary [here](binaries/demon). 

Opening the binary in our reversing tool of choice (we will use Rizin Cutter) we can see a number of Windows. By double clicking the `main` function from the `symbols` tab on the left, we see that the disassembly and decompilation of the binary is displayed.

![Cutter Disassembly View](images/ss1.png)

For this challenge we will just use the decompilation, the disassembly will become more important next week. Next we need to understand what the program does. You may notice that variable names have not survived compilation, which can make the code look quite confusing. We can go through and rename the variables to increase readability.

![Cutter Decompiler View](images/ss2.png)

So what does it do?

1. An `xor` operation is executed on the flag string.
2. An `xor` operation is executed on another string. 
3. Text is displayed to the user via the `puts` & `printf` functions.
4. User input is taken via `gets`.
5. The user input is compared with the password (from step 2) using `strcmp` - this stands for string compare and will evaluate to true if both strings match.
6. Dependant on whether step 5 is true or false, a different message is displayed to the user. Presumably if this is true the flag will be displayed.

We can run the binary to check our understanding.

```
> ./demon

Luciafer v1.0
Say the demon's name to gain access to the secret.
Enter the demon's name: foobar

That is not the demon's name.
```

We were correct. So our user input is compared with a password string, but the password gets decoded before it is compared with the user input. The same happens with the flag string - it is decoded before checking we have the correct password. This means we can run the program in a debugger, inspect the memory and registers when the string comparison occurs, and grab both the flag and the password.

We can open the binary in PwnDbg (GDB), and use `starti` to set a temporary breakpoint immediately on entry. We can the view the disassembly of the main function to look for the string comparison using the command `disassemble main`. We can see the libc function `strcmp` is called at address `main+240`.

```python
0x0000555555555242 <+221>:	call   0x555555555060 <gets@plt>
0x0000555555555247 <+226>:	lea    rdx,[rbp-0x3b]
0x000055555555524b <+230>:	lea    rax,[rbp-0x2f]
0x000055555555524f <+234>:	mov    rsi,rdx
0x0000555555555252 <+237>:	mov    rdi,rax
0x0000555555555255 <+240>:	call   0x555555555050 <strcmp@plt>
0x000055555555525a <+245>:	test   eax,eax
```

So let's set a breakpoint there, we know the value should be in `rsi`. We can use `x` to see what value is in an address or register, we can reference registers by prepending the register name with `$`. We can tell GDB which data type we want to view the data as by using a character after a `/`. So we can print a string at a specific address `x/s`.

```
b *main+240
r
pwndbg> x/s $rsi
0x7fffffffdb05:	"Adrammelech"
```

The password is *Adrammelech*. We can check this by entering it into the program.

```
> ./demon

Luciafer v1.0
Say the demon's name to gain access to the secret.
Enter the demon's name: Adrammelech

You are correct.
flag{AdraMMel3ch}
```

This was actually unnecessary because the flag text is stored on the stack already. We can print multiple addresses at a time by inserting a number before specifying the data type.

```
pwndbg> x/5s $rsp
0x7fffffffdaf0:	"flag{AdraMMel3ch}"
```

So this demonstration shows why hard coding passwords, and operating on sensitive data before verifying access rights is bad IT security practice.

## Demo 2

This challenge is actually solvable via the previous method, so feel free to try that if you want, but we will demo a different method to get the flag. You can download the binary [here](binaries/serial).

Opening the binary in Cutter and looking at the code, we can see the code is similar to the previous demo and that we could solve it using the previous method - but let's imagine the flag is inaccessible and we need to manually decode the password in order to access the flag.

![Disassembly of main](images/ss3.png)

The important section is this if statement, we can see some stack addresses are compared to hex values, so the hex values must represent the password, so let's just decode that.

```c
if (((iStack536 == 0x68632d746e753063) && (iStack528 == 0x6c756330)) && (iStack524 == 0x61))
```

We can do this simply in ipython (I know there are more efficient ways to do it but this was done impromptu in the demo). Remember we need to reverse each section due to the data being stored on the stack, which in this binary is little-endian.

```py
In [1]: import binascii
In [2]: password = bytearray.fromhex("68632d746e753063")
In [3]: password.reverse()
In [4]: password2 = bytearray.fromhex("6c756330")
In [5]: password2.reverse()
In [6]: password3 = bytearray.fromhex("0x61")
In [8]: password3.reverse()
In [9]: password+password2+password3
Out[9]: bytearray(b'c0unt-ch0cula')
```

We can now get the flag.

```
> ./serial
What is the best and sp00kiest breakfast cereal?
Please enter the passphrase: c0unt-ch0cula
flag{c0unt-ch0cula-cereal-FTW}
```

## Conclusion

I won't go through the third demo because it is a Hack The Box challenge, and HTB rules stipulate that write ups of live challenges are not allowed. If you want to keep practicing your reversing skills you can download the zipped challenges binaries from [here](binaries/challenges.zip). I hope this was an informative article, and that it covers most of what we went through during the session. Next week we will be combining the knowledge gained from week 1 and this week in order to attempt our first buffer overflow attack - stack smashing.

