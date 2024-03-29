# Important files
* /etc/group
* /etc/passwd
* /etc/shadow

# Notes
From Steve Z.: typically new user groups are in the 2000s. Groups <1000 are 
system groups, eg apache, bind. Groups 1000-2000 are usually the default user 
group. new user 1003 = default group 1003. So sysadmins typically create novel 
groups in the 2000s, 5000s or 10000s depending on how many users you think 
you'll create

This is just a convention though.  Nothing wrong with group #200, but it will 
look a bit weird to some sysadmins

(groups <1000 are typically created by apt/yum/pkg and other package installers
 when you install a daemon service)

# I. Editing files directly
* `vipw` for /etc/passwd
* `vigr` for /etc/group

# II. Users
## A. Add Users
* `sudo adduser username` # Add users
* `sudo adduser --disabled-password dletran` # create user with no password (ssh access only)
   
## B. Reset pw, Delete pw, expire user's pw upon login
* `sudo passwd username` - resets user's password
* `sudo passwd -d username` - deletes user's current password
* `sudo passwd -e username` - forces user to update password upon login

## C. Delete user
* `sudo userdel -r username` - delete users

## D. Add and delete user to group
* `sudo usermod -aG group1,group2 username` - add username to group1/2
* `sudo deluser username group` - removes user from group
* `sudo -l -U username` - checks if user has been deleted

### RHEL
* `sudo usermod -aG wheel username` - adds to sudo for RHEL

# III. Groups
*  `groupadd new_group` - create a new group

## other common group commands
* ` grep sudo /etc/group` - searchers for 'sudo' in the group file
* `chgrp -R group .` - adds group to owner of current-dir recursively
* `chown -R dletran some_dir` - changes owner to Duke

# IV. SSH key management
You may want to add the user's public key to their account. Make sure 
your user account owns .ssh and .ssh/authorized_keys 
* `sudo -iu username` - login as user
* `chmod 0600 ~/.ssh/authorized_keys`
* `chmod 0700 ~/.ssh`

# V. Example of provisioning new user with access
## A. Create User
```
sudo adduser username
sudo passwd username # set random pw
sudo passwd -e username # set to expire upon login
sudo usermod -aG group1,group2 username
```
## B. Setup SSH
```
sudo -iu username
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
chmod 0700 ~/.ssh
chmod 0600 ~/.ssh/authorized_keys
```

## C. Contact user
* send user email notifying of login credentials
    * server:
    * username:
    * password:
* 

# Other notes
The difference between `adduser` and `useradd` is that `adduser` is a high-level utility that is more user-friendly and interactive, while `useradd` is a low-level utility that is more suitable for scripting and system use12. Adduser is a Perl script that uses `useradd` in the background, but also performs additional tasks such as creating the home directory, setting the password, and asking for user information13. Useradd is a built-in Linux command that can be found on any Linux system, but it does not create the home directory and password by default, and it requires more options to be specified14.

You can use either `adduser` or `useradd` to create users on Ubuntu, but `adduser` is recommended for most cases because it is easier and more complete. Useradd can be used for scripting or when you need more control over the user creation process. You can also modify the default behavior of both commands by editing the /etc/adduser.conf and /etc/login.defs files4.
# Links
* https://unix.stackexchange.com/questions/79176/is-there-any-reason-to-avoid-editing-etc-group-directly
* https://linuxize.com/post/how-to-create-groups-in-linux/
* https://linuxize.com/post/how-to-add-user-to-group-in-linux/
* https://linuxize.com/post/how-to-delete-users-in-linux-using-the-userdel-command/
