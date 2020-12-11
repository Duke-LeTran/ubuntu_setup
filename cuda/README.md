# Cuda Libraries
This documentation is still a work in progress as of 2020-12-11. The shell scripts below is for 
installing latest version of cuda on ubuntu 20.04, see more details from  [here](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=2004&target_type=deblocal).
Make sure you're reading the `deb(local)` installation instead of the `*.run`
Also note, as of 2020-12-11, tensorflow is using cuda architechtures of 7.0

It seems conda will install cuda directly to your env if you install 
via `conda install tensorflow-gpu`.

Cuda 11 will NOT work with tensorflow (which currently supports cuda 10.1)

```{sh}
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.1.1/local_installers/cuda-repo-ubuntu2004-11-1-local_11.1.1-455.32.00-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-1-local_11.1.1-455.32.00-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-1-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda
```

Currently, installing the cuda libraries directly will place the files in
`/usr/local/cuda-11.1`

You must also add `/usr/local/cuda-11.1/bin` to your path to access tools such as
`nvcc -- version`

## Docker
https://www.tensorflow.org/install/docker

## References
* https://developer.nvidia.com/cuda-gpus
* https://www.tensorflow.org/install/gpu
* https://developer.nvidia.com/cudnn
* https://old.reddit.com/r/nvidia/comments/hg45ux/is_cuda_11_compatible_with_tensorflow/

