
run:
	git pull && ansible-playbook playbook.yml --ask-become-pass
	# git pull && ansible-playbook playbook.yml --ask-vault-pass --ask-become-pass



# sudo docker run --rm -it archy /bin/bash -c "
# su - nasoooor -c '
#   cd ~ &&
#   git clone https://github.com/nasoooor29/dotfiles &&
#   cd dotfiles &&
#   git checkout ansible &&
#   bash'
# "
