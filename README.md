[![button](https://files.teunjojo.com/theme/download-button.svg)](https://files.teunjojo.com/check-running/latest/check-running.sh)
<br><img src="https://img.shields.io/badge/dynamic/json?color=informational&label=version&prefix=v&query=%24.version&url=https%3A%2F%2Ffiles.teunjojo.com%2Flatest.php%3Frepo%3Dcheck-running%26data_type%3Djson">
# check-running
Shell script that send a Pushover notification when your Minecraft server is offline

## installation
1. [Set up Pushover](https://support.pushover.net/i7-what-is-pushover-and-how-do-i-use-it)
2. Run the script once manually and then edit the created config file.
3. Add the script to your cronjob file
    - Execute `crontab -e`
    - Add line `* * * * * /path/to/script.sh` to the file (This executes the script every minute)
    - Save the file
