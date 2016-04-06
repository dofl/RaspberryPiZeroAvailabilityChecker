BASH script for checking Raspberry Pi Zero availability at distributors

Add it to cron:
*/10 *   *   *   *      bash /opt/piZeroChecker/piZeroChecker.sh > /dev/null 2>&1
