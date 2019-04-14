Hi all,

i'm working on a script to easily install Kali on WSL, and i would like to share it with community, i hope this can be useful for everyone.

The script is hosted here (GitHub):
https://github.com/randomtable/ChimeraOS/blob/master/ISO/auto-build-kali.bat

This project aim to provide a complete Kali installation (with metapackage "kali-linux-all") in WSL.

WSL is a great tool, released by Microsoft, and thanks to it, various processes can be automated, like installing and upgrading a distribution.

This script will install xfce4 for rdp sessions, the metapackage "kali-linux-all" (you can install any metapackage by modify the batch file) and setup a non-root user for any other user purpose.

Script guide:

1 . Install WSL, then install kali from Microsoft app store
2 . Open kali app, then at username prompt, leave blank and push "enter", this will cause the default user will be "root".
3 . Download and launch the script from Windows.
4 . Almost all operations are automated, but in the install phase you can receive some alerts that have to be managed manually.

5 . At the end of the build process, you have the latest packages.
IMPORTANT: Manually create a user and a password, for connect to xrdp server.

6 . Restart LxssManager, then connect to 127.0.0.1:3390 (there is a video on the official page too), then enter the command "/etc/init.d/xrdp start" for initialize the rdp server.
7 . Enjoy!

For update your distribution, launch the script and wait process completion.
The script will restart itself at every build/update.

This script was tested in a "clean" WSL environment, with no other distributions.

Let me know if there is bugs, errors, improvements to this process.
