docker build -t archy . --file scripts/dockerfile
sudo docker run -v /home/nasoooor/dotfiles:/home/nasoooor/dotfiles --rm -it archy /bin/bash -c "
su - nasoooor -c '
  cd ~ &&
  cd dotfiles &&
  git checkout ansible &&
  bash'
"
