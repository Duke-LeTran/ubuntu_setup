# Starship
## https://starship.rs/
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo "\\n" >> ~/.bashrc # add new line
echo "eval '$(starship init bash)'" >> ~/.bashrc
