docker build -t archy .
sudo docker run --rm -it archy /bin/bash -c "
su - nasoooor -c '
  cd ~ &&
  git clone https://github.com/nasoooor29/dotfiles &&
  cd dotfiles &&
  git checkout ansible &&
  bash'
"
