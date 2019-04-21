xcopy /y "%~dp0db_autopwn.rb" C:\metasploit-framework\embedded\framework\plugins\db_autopwn.rb
C:\metasploit-framework\embedded\bin\initdb.exe msf
"C:\metasploit-framework\embedded\bin\pg_ctl" -D "msf" -l logfile start
C:\metasploit-framework\embedded\bin\createdb.exe msf
C:\metasploit-framework\bin\msfconsole.bat -q -r "%~dp0mastersploit.txt"