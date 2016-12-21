#exchange_key.sh
if [ $# -eq 0 ]
  then
    echo "You must supply the distant account and computer : account@ip as 1st paramter"
else
	ssh-keygen -t dsa -f ~/.ssh/id_dsa 
	cat ~/.ssh/id_dsa.pub | ssh $1 "cat - >> ~/.ssh/authorized_keys"

	cat <<EOT >> ~/.bashrc
			SSH_ENV="$HOME/.ssh/environment"

		function start_agent {
		     echo "Initialising new SSH agent..."
		     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
		     echo succeeded
		     chmod 600 "${SSH_ENV}"
		     . "${SSH_ENV}" > /dev/null
		     /usr/bin/ssh-add;
		}

		# Source SSH settings, if applicable

		if [ -f "${SSH_ENV}" ]; then
		     . "${SSH_ENV}" > /dev/null
		     #ps ${SSH_AGENT_PID} doesn't work under cywgin
		     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
		         start_agent;
		     }
		else
		     start_agent;
		fi


	EOT
fi

# 1) create a ssh key
scp ~/.ssh/id_rsa romain@192.168.0.70:.ssh/
# 2) send it to the remote host
cat ~/.ssh/id_rsa.pub | ssh romain@192.168.0.70 'cat - >> ~/.ssh/authorized_keys'
# 3) add an agent in the system
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"machines=("dell" "pb")
ips=( "192.168.0.70" "192.168.0.60")
n=-1
for nom_machine in "${machines[@]}"
do
        n=$(( $n + 1 ))
        ip_machine=${ips[$n]}
        link=" $ip_machine $nom_machine"
        $(sudo /bin/bash -c  'echo -e $link  >> /etc/hosts')

done
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi
# 4) tell the agent the passphrase
ssh-add ~/.ssh/id_dsa
# 5) enjoy an agent working freely for You
ssh romain@192.168.0.70