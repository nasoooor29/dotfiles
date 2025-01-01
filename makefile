
run:
	git pull && ansible-playbook playbook.yml --ask-vault-pass --ask-become-pass
