# nightly-web-backupper
A docker image for creating nightly archives for backing up websites 

## Usage Details


### Environment Variables
 - `CRON_TIMER` - The timer for your backup, in the cron format. Defaults to `30 2 * * *`
 - `USER_ID` - The user id that will create the archives. Ex. `1000`
 - `GROUP_ID` - The group id that will be assigned to the created user. Ex. `1000`
 - `WEBSITE_NAME` - The name that will prepend the archives names