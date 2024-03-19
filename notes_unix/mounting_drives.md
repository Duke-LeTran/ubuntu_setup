This is for Debian/Ubuntu based servers using CIFS and Samba.

# Setup
## CIFS drivers
If necessary, install drivers:
* `sudo apt install cifs-utils`

## Mount points
Create the mount folders if necessary:
* `sudo mkdir /mnt/home`
* `sudo mkdir /mnt/shared`
* `sudo mkdir /mnt/project_dir`


## Credentials
Create a credentials file at `~/.config/win/.winauth`. Make sure you set the
permissions to `600`.

```
username=yourusername
password=fakepw123
domain=HS
```

Alternatively, other suggested locations for this file could be:

* `/root/.cifscreds`
* `/root/.smbcredentials`
* `/root/.winauth`

# Mounting

Mount the drive. Specifying the version of SMB may be the key.

```
sudo mount -t cifs '//hshome/shared/Path Space/To/Folder' /mnt/project_dir -o credentials=/home/daletran/.config/win/.winauth,vers=2.0

```

Unmount the drive.

```
sudo umount /mnt/shared
```

# Docker

Let's say you need to mount the shared drive now on a docker container -- just 
treat it like a regular file path. Use bind mount.

docker-compose.yml:

```
services:
  container_with_mounted_drive:
    build: ./path_to_DockerFile
    volumes:
      - "/mnt/shared/Path Space/To/Folder/:/app/docker_container/shared_folder"
```

# References
* https://unix.stackexchange.com/questions/436178/how-to-use-a-credential-file-when-mounting-a-samba-share-using-mount-command
* https://unix.stackexchange.com/questions/144522/mounting-cifs-operation-not-supported