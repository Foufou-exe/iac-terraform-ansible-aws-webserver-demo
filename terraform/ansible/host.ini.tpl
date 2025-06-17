[webservers]
web-apache-tm ansible_host=${web_apache_ip} ansible_user=admin ansible_ssh_private_key_file=/home/admin/.ssh/web-apache-tm-key

[all:vars]
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
ansible_python_interpreter=/usr/bin/python3
