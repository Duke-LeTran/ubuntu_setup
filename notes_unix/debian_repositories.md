Debian Repository Management

# Overview 
| Component         | Description|
|:------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `main`            | - Contains packages that comply with the Debian Free Software Guidelines (DFSG) and are part of the official Debian distribution.<br>- Packages are actively maintained by the Debian project.<br>- Includes most core packages and widely used software. |
| `contrib`         | - Contains packages that are free software themselves but may depend on or recommend non-free packages.<br>- Not part of the official Debian distribution due to dependencies on non-free software.       |
| `non-free`        | - Contains packages that do not comply with the DFSG or have restrictive licenses.<br>- Not considered free software and not officially part of Debian.<br>- Includes proprietary firmware, drivers, or software with restrictive redistribution terms. |
| `non-free-firmware` | - Specific to Debian 11 "Bullseye" and later.<br>- A subset of the `non-free` component that contains only firmware packages.<br>- Provides a convenient way to access firmware packages without enabling the entire `non-free` repository. |

# Quick Reference

## Key commands
* `apt-cahce policy` - 
* `cat /etc/apt/sources.list`
* `ls -l /etc/apt/sources.list.d`

## Key directories and files
* `/etc/apt/sources.list`
* `/etc/apt/sources.list.d`

# FAQ

## Can I periodically pull from the non-free repository without fully turning it on all the time?

Yes, you can periodically pull packages from the `non-free` repository without enabling it permanently in your Debian system. Here are a few ways to achieve this:

1. Temporary repository addition:
   - You can temporarily add the `non-free` repository to your `sources.list` file, install the desired packages, and then remove the repository entry.
   - Open the `/etc/apt/sources.list` file with root privileges using a text editor.
   - Add the `non-free` component to the repository lines, for example:
     ```
     deb http://deb.debian.org/debian bookworm main non-free
     ```
   - Save the file and run `sudo apt update` to update the package lists.
   - Install the desired non-free packages using `sudo apt install package-name`.
   - After installing the packages, remove the `non-free` component from the repository lines in the `sources.list` file.
   - Run `sudo apt update` again to revert to the original package lists.

2. Manual package download:
   - You can download the `.deb` package files for the desired non-free packages from the Debian package archive website (https://packages.debian.org/).
   - Search for the package you need and navigate to the appropriate Debian release and architecture.
   - Download the `.deb` file(s) for the package and its dependencies, if any.
   - Install the downloaded `.deb` files using the `dpkg` command:
     ```
     sudo dpkg -i package-file.deb
     ```
   - If there are missing dependencies, you can resolve them by running:
     ```
     sudo apt install -f
     ```

3. APT pinning:
   - You can use APT pinning to assign a lower priority to the `non-free` repository, so that packages are only installed from it when explicitly requested.
   - Create a new file in `/etc/apt/preferences.d/` directory, for example, `non-free-pin`:
     ```
     Package: *
     Pin: release a=bookworm,c=non-free
     Pin-Priority: 100
     ```
   - Adjust the release name (`bookworm`) according to your Debian version.
   - This configuration assigns a priority of 100 to packages from the `non-free` repository, which is lower than the default priority of 500 for the main repository.
   - Update the package lists with `sudo apt update`.
   - When you want to install a package from the `non-free` repository, use the `-t` option with `apt install`:
     ```
     sudo apt install -t bookworm package-name
     ```

These methods allow you to selectively install packages from the `non-free` repository without permanently enabling it. However, keep in mind that manually managing non-free packages requires more effort and attention to maintain the system's stability and security.

It's important to regularly review and update the installed non-free packages to ensure they are compatible with your system and receive necessary security updates.

## what's the difference between dpkg and apt-get?

`dpkg` and `apt-get` are both package management tools in Debian-based systems, but they serve different purposes and operate at different levels.

1. `dpkg` (Debian Package Manager):
   - `dpkg` is a low-level package management tool that operates directly on individual `.deb` package files.
   - It is responsible for installing, removing, and managing packages on the system.
   - `dpkg` handles the actual installation process, including extracting package files, configuring packages, and updating the system's package database.
   - It does not automatically resolve dependencies or download packages from remote repositories.
   - `dpkg` is typically used when you have a `.deb` package file locally and want to install it manually.
   - Examples of `dpkg` commands:
     - Install a package: `sudo dpkg -i package.deb`
     - Remove a package: `sudo dpkg -r package`
     - List installed packages: `dpkg -l`

2. `apt-get` (Advanced Package Tool):
   - `apt-get` is a high-level package management tool that works with repositories and resolves dependencies automatically.
   - It is part of the `apt` (Advanced Package Tool) suite of tools, which includes other commands like `apt-cache` and `apt-config`.
   - `apt-get` relies on the package information provided by the repositories configured in the `/etc/apt/sources.list` file and additional files in the `/etc/apt/sources.list.d/` directory.
   - It can automatically download packages from remote repositories, resolve dependencies, and install or upgrade packages.
   - `apt-get` uses `dpkg` internally to perform the actual package installation and removal.
   - Examples of `apt-get` commands:
     - Install a package: `sudo apt-get install package`
     - Remove a package: `sudo apt-get remove package`
     - Update package lists: `sudo apt-get update`
     - Upgrade installed packages: `sudo apt-get upgrade`

In summary, `dpkg` is a low-level tool that operates directly on `.deb` package files, while `apt-get` is a high-level tool that works with repositories, resolves dependencies, and manages packages more conveniently.

In most cases, users interact with `apt-get` (or the newer `apt` command) to manage packages, as it provides a more user-friendly and automated approach to package management. `dpkg` is used when manual installation of `.deb` files is required or for certain low-level package management tasks.

It's worth noting that in recent versions of Debian and Ubuntu, the `apt` command is available as a more user-friendly alternative to `apt-get`. The `apt` command combines the most commonly used features of `apt-get` and `apt-cache` into a single command for easier package management.