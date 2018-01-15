source 00_00_conf_reseau.conf
destination=$(whoami)@$ip_master
echo $destination
#exchange_key.sh
	# 1) create a key
	if [ -e ~/.ssh/id_rsa ]; then
		echo 'Key exist, reusing.'
	else
		ssh-keygen -t rsa -f ~/.ssh/id_rsa
	fi
	# 2) send the key to the distant server
	ssh $destination
	cat ~/.ssh/id_rsa.pub | ssh  $destination "cat - >> ~/.ssh/authorized_keys"

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
	ssh $destination
