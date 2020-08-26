#################################
# This script expects 2 parameters
# 1. List of target hosts (comma separated)
# An inventory file, along with its host specific variables, if any.
# Example inventory file contents can be :
# INVENTORY_FILE_START
# server_name server_name_key1=server_name_value1 server_name_key2=server_name_value2
# server_name2 server_name2_key1=server_name2_value1 server_name2_key2=server_name2_value2
# INVENTORY_FILE_END
#
# Sample usage of this file:-
#
# run_playbook-01.sh server_name,server_name2 inventory_file_name
#
#
# This script also sets ANSIBLE_STDOUT_CALLBACK so that 
# output is human readable 
#################################
CURR_DIR=`dirname $0`
server_list=$1
inventory_file=$2

echo $server_list
echo $inventory_file
#check if all is passed
is_all=`echo "$server_list"|tr '[A-Z]' '[a-z]'`
echo $is_all
if [ "$is_all" = "all" ]; then
echo "ALL parameter is not allowed. Exiting script. Please provide comma separated list of server names."
exit
else
export ANSIBLE_PYTHON_INTERPRETER=/usr/bin/python3
export ANSIBLE_STDOUT_CALLBACK=debug
ansible-playbook --extra-vars "server_list=${server_list}" -i ${inventory_file} -u ssh_user -vv ${CURR_DIR}/playbooks/playbook-01.yml
fi
