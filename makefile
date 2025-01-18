
run:
	git pull && ansible-playbook playbook.yml --ask-become-pass -vvv
	# git pull && ansible-playbook playbook.yml --ask-vault-pass --ask-become-pass



