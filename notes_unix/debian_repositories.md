Debian Repository Management

# Overview 
| Component         | Description|
|:------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `main`            | - Contains packages that comply with the Debian Free Software Guidelines (DFSG) and are part of the official Debian distribution.<br>- Packages are actively maintained by the Debian project.<br>- Includes most core packages and widely used software. |
| `contrib`         | - Contains packages that are free software themselves but may depend on or recommend non-free packages.<br>- Not part of the official Debian distribution due to dependencies on non-free software.       |
| `non-free`        | - Contains packages that do not comply with the DFSG or have restrictive licenses.<br>- Not considered free software and not officially part of Debian.<br>- Includes proprietary firmware, drivers, or software with restrictive redistribution terms. |
| `non-free-firmware` | - Specific to Debian 11 "Bullseye" and later.<br>- A subset of the `non-free` component that contains only firmware packages.<br>- Provides a convenient way to access firmware packages without enabling the entire `non-free` repository. |

# Key commands

* `apt-cahce policy`
* `cat /etc/apt/sources.list`
* `ls -l /etc/apt/sources.list.d`