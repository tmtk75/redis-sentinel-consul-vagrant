playbook: roles
	ansible-playbook -i hosts.ini playbook.yml

roles:
	ansible-galaxy install -r requirements.yml --force

join:
	ansible -i hosts.ini -m shell all -l node2,node3 -a "/usr/local/sbin/consul join 172.21.0.101"

.e/bin/ansible:
	.e/bin/pip install ansible

.e/bin/pip:
	virtualenv .e
