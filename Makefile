playbook: ssh-config
	ansible-playbook -i hosts.ini playbook.yml

ssh-config:
	vagrant ssh-config > ssh-config

.e/bin/ansible:
	.e/bin/pip install ansible

.e/bin/pip:
	virtualenv .e
