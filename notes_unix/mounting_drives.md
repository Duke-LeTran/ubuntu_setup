This is for Debian/Ubuntu based servers using CIFS and 

# Setup
## CIFS drivers
If necessary, install drivers:
* `sudo apt install cifs-utils`

## Mount points
Create the mount folders if necessary:
* `sudo mkdir /mnt/home`
* `sudo mkdir /mnt/shared`
* `sudo mkdir /mnt/project_dir`


## Credentails
Create a credentials file at `~/.config/win/.winauth`

```
username=yourusername
password=fakepw123
domain=HS
```

## Mounting

Mount the drive. Specifying the version of SMB may be the key.

```
sudo mount -t cifs '//hshome/shared/Path Space/To/Folder' /mnt/project_dir -o credentials=/home/daletran/.config/win/.winauth,vers=2.0

```

Unmount the drive.

```
mount -t cifs //hshome/shared /mnt/shared -o credentials=~/.config/win/.winauth
```

sudo mount -t cifs '//hshome/shared/Path Space/To/Folder' /mnt/project_dir -o credentials=~/.config/win/.winauth

# References
* https://unix.stackexchange.com/questions/436178/how-to-use-a-credential-file-when-mounting-a-samba-share-using-mount-command
* https://unix.stackexchange.com/questions/144522/mounting-cifs-operation-not-supported