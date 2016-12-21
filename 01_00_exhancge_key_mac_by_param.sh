#!/bin/
if [ $# -eq 0 ]
  then
    echo "You must supply the distant account and computer : account@ip as 1st paramter"
else
	cat ~/.ssh/id_rsa.pub | ssh $1 'cat >> ~/.ssh/authorized_keys'
fi

