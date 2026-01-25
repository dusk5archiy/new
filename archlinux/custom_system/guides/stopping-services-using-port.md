# Stopping services using ports

Retrieve the PID of the process using port `3000`, for example:

```bash
sudo fuser 3000/tcp
```

Close the process:

```bash
sudo kill '<pid-here>'
```
