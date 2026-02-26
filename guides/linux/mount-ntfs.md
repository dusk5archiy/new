# Mounting NTFS Drives

## Ubuntu

Install `ntfs-3g`

```bash
sudo apt install ntfs-3g
```

Find your drive in the output of this command:

```bash
lsblk
```

Mount the drive (suppose that your drive is `/dev/sda1`):

```bash
sudo mkdir -p /mnt/e # Mount point is /mnt/e
sudo mount /dev/sda1 /mnt/e
```
