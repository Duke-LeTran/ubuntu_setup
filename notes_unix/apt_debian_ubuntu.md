# Apt vs. Apt-get
| Use Case                                | apt                           | apt-get / apt-cache                  |
|-----------------------------------------|-------------------------------|--------------------------------------|
| Installing packages                     | sudo apt install package    | sudo apt-get install package       |
| Removing packages                       | sudo apt remove package     | sudo apt-get remove package        |
| Updating the package list               | sudo apt update             | sudo apt-get update                |
| Upgrading installed packages            | sudo apt upgrade            | sudo apt-get upgrade               |
| Searching for packages                  | apt search keyword          | apt-cache search keyword           |
| Displaying package information          | apt show package            | apt-cache show package             |
| Cleaning up unused packages             | sudo apt autoremove         | sudo apt-get autoremove            |
| Cleaning up downloaded package files    | sudo apt autoclean          | sudo apt-get autoclean             |
| Displaying package dependencies         | apt depends package         | apt-cache depends package          |
| Displaying reverse dependencies         | apt rdepends package        | apt-cache rdepends package         |
| Listing installed packages              | apt list --installed        | dpkg -l                            |
| Listing upgradable packages             | apt list --upgradable       | apt-get -u upgrade --assume-no     |
| Downloading package files               | apt download package        | apt-get download package           |
| Installing local package files          | sudo apt install ./package.deb | sudo dpkg -i package.deb        |
| Resolving broken dependencies           | sudo apt --fix-broken install | sudo apt-get -f install          |