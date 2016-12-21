
#exchange_key.sh
if [ $# -eq 0 ]
  then
    echo "You must supply the distant account and computer : account@ip as 1st paramter"
else
	# 1) create a key
	ssh-keygen -t rsa -f ~/.ssh/id_rsa

	# 2) send the key to the distant server
	cat ~/.ssh/id_rsa.pub | ssh $1 "cat - >> ~/.ssh/authorized_keys"

	# 3) create an agent on your bashrc
	echo '
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
		     #ps ${SSH_AGENT_PID} doesnt work under cywgin
		     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
		         start_agent;
		     }
		else
		     start_agent;
		fi
		' >> ~/.bashrc
	# 4) activate the agent
	source ~/.bashrc
	# 5) tell the agent wich secret he should know to become a secret agent.
	ssh-add ~/.ssh/id_rsa
	# 6) enjoy a free connection to the distant host
	ssh $1
fi
