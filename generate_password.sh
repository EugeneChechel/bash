#!/bin/bash
#Generate new password 8 chars len.
generated_password=$(date +%s | md5 | head -c 8)
# Send to.
TO='to@email.com'
path_to_file='/var/www/.htpasswd'
user_name='user'

# update password file.
htpasswd -b -c $path_to_file $user_name $generated_password
sendmail -i $TO <<MAIL_END
Subject: Smart Branch New Password
To: $TO

New password: $generated_password
MAIL_END

