# ssh keys
# https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
cd ~
ssh-keygen -t ed25519 -C ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# add the public key generated to the server