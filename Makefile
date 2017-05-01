default:
	@echo "You must specify an action."
	@echo " - deploy: Initiate deployment"
	@echo " - scaffold: Initialize the shared/ and private/ directories"


scaffold:
	mkdir -p shared private
	ssh-keygen -N '' -f private/ansible.key
	cp private/ansible.key.pub shared/authorized_keys
	touch shared/yubikey_mappings
	cp examples/inventory examples/yubikey_mappings shared

deploy: main web slackirc

main:
	ansible-playbook -i shared/inventory playbooks/main.yml --private-key private/ansible.key

web:
	ansible-playbook -i shared/inventory playbooks/web.yml --private-key private/ansible.key

slackirc:
	ansible-playbook -i shared/inventory playbooks/slackirc.yml --private-key private/ansible.key

