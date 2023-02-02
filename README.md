# check-running
Shell script that send a Pushover notification when your Minecraft server is offline

## installation
1. [Set up Pushover](https://support.pushover.net/i7-what-is-pushover-and-how-do-i-use-it)
2. Run the script once manually and then edit the created config file.
3. Add the script to your cronjob file
    - Execute
    ```bash
    crontab -e
    ```
    - Add line `* * * * * /path/to/script.sh` to the file (This executes the script every minute)
    - Save the file
