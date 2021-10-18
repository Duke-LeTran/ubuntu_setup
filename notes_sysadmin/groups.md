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

# Editing files directly
* `vipw` for /etc/passwd
* `vigr` for /etc/group

# Common commands
* ` grep sudo /etc/group` - searchers for 'sudo' in the group file
* `usermod -a G group1,group2 username`

# Other related commands
* `chgrp -R group .` - adds group to owner of current-dir recursively
* `chown -R dletran some_dir` - changes owner to Duke

# Links
* https://unix.stackexchange.com/questions/79176/is-there-any-reason-to-avoid-editing-etc-group-directly
* https://linuxize.com/post/how-to-create-groups-in-linux/
* https://linuxize.com/post/how-to-add-user-to-group-in-linux/
