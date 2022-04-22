[![button](https://img.shields.io/badge/Download-success)](https://files.teunjojo.com/download.php?file=check-running)
<br><img src="https://img.shields.io/badge/dynamic/json?color=informational&label=version&prefix=v&query=%24.version&url=https%3A%2F%2Ffiles.teunjojo.com%2Flatest.php%3Frepo%3Dcheck-running%26data_type%3Djson">
<br><br>[![button](https://img.shields.io/badge/Donate-yellow?logo=paypal)](https://www.paypal.com/donate/?hosted_button_id=U9YA79HDTWTZW)
# check-running
Shell script that send a Pushover notification when your Minecraft server is offline

## installation
1. [Set up Pushover](https://support.pushover.net/i7-what-is-pushover-and-how-do-i-use-it)
2. Run the script once manually and then edit the created config file.
3. Add the script to your cronjob file
    - Execute `crontab -e`
    - Add line `* * * * * /path/to/script.sh` to the file (This executes the script every minute)
    - Save the file
