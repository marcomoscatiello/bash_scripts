#!/bin/sh


USER_NAME="marcomoscatiello"
USER_DESC="Marco Moscatiello"
USER_PUB_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbH0HcY7tur6Ia1PYpisk6XNujO1LVNSSTPGLL/88fMM7SqamquUTRb7YtOrsb6Sng5q3XWLA+ddhwt9KkdoFFANq258YwyNRGzUJltqQRGA5BX2vXhjPP9xz5dua3G0QWbxRrfsgQMF3mPowCMCf7NEXf7M6vbYgNdhdTGli2M438kUNzysFGzhkSQlqe5RBI7WN56DQ74JqtvYvT131xPRf8XU1vO7MAvzeD4TpKrpi9SpEsDhLSxCmcKtLhiHcH9nrRzYpSiJZM+rPuu8i+wTXMpqjP3kIeOpCMg+XHqtDFmCHxIRQ8FF8LlfXXugDTI9/WJNbxcDpbNmqovUx/ marcomoscatiello"

HOME_DIR="/home"

SSH_GROUP="sshusers"
EXTRA_GRP="tomcat apache"

SUDOERS_FILE="/etc/sudoers.d/users"

useradd -c "$USER_DESC" -m -U -s /bin/bash $USER_NAME
passwd -d $USER_NAME

    echo -e "colorscheme desert" > $HOME_DIR/$USER_NAME/.exrc
    echo -e "set cindent" >> $HOME_DIR/$USER_NAME/.exrc
    echo -e "set hlsearch" >> $HOME_DIR/$USER_NAME/.exrc
    echo -e "syntax on" >> $HOME_DIR/$USER_NAME/.exrc
    echo -e "set tabstop=4" >> $HOME_DIR/$USER_NAME/.exrc
    chown -R $USER_NAME. $HOME_DIR/$USER_NAME/.exrc

        mkdir -p $HOME_DIR/$USER_NAME/.ssh
        chmod 700 $HOME_DIR/$USER_NAME/.ssh
        echo $USER_PUB_KEY > $HOME_DIR/$USER_NAME/.ssh/authorized_keys
        chmod 600 $HOME_DIR/$USER_NAME/.ssh/authorized_keys
    chown -R $USER_NAME. $HOME_DIR/$USER_NAME/.ssh

usermod -a -G $SSH_GROUP $USER_NAME

for grp in $EXTRA_GRP ; do
if getent group $grp > /dev/null
then usermod -a -G $grp $USER_NAME
fi
done

if [ ! -f "$SUDOERS_FILE" ]; then
                touch $SUDOERS_FILE
                chmod 400 $SUDOERS_FILE
        fi

echo "$USER_NAME ALL=NOPASSWD: /sbin/service httpd *, /sbin/service tomcat *, /sbin/service terracotta *, /sbin/service rabbitmq-server *" >> $SUDOERS_FILE



