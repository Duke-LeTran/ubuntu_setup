# Starship
## https://starship.rs/
## if you wish to install using a custom directory

while getopts hb: flag
do
    case "${flag}" in
	h) echo "Usage: use -b specific BIN_DIR";;
	b) bin_directory=${OPTARG};;
    esac
done

# if bin_dir passed, use that
if [ -z "$bin_directory" ]; then
    export BIN_DIR=$bin_directory
fi

### Start script
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

### Add env variables
echo "\\n" >> ~/.bashrc # add new line
echo "eval '$(starship init bash)'" >> ~/.bashrc
tail ~/.bashrc
