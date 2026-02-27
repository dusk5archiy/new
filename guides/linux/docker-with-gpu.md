# Docker With Gpu

- Install NVIDIA Container Toolkit via [here](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html).
- After installation, run the following commands:

```bash
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
```
