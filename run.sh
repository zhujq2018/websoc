#!/bin/bash
export USER=root
mkdir -p /var/run/sshd
mv /authorized_keys /root/.ssh/authorized_keys
mv /id_rsa /root/.ssh/id_rsa
mv /id_rsa.pub /root/.ssh/id_rsa.pub
chmod 600 /root/.ssh/authorized_keys
chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub
nohup /usr/sbin/sshd -D &
echo 'PS1='"'"'${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;35;35m\]\w\[\033[00m\]\$\033[1;32;32m\] '"'" >> /root/.bashrc

wget -O /usr/local/bin/websocat https://github.com/vi/websocat/releases/download/v1.12.0/websocat.x86_64-unknown-linux-musl

websocat --binary ws-l:10.16.18.69:8080 tcp:127.0.0.1:22
