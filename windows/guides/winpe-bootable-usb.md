# Create WinPE bootable USB

## Preparing a USB

- Use `Diskpart` to create a 500 MB FAT32 partition with letter `P`.

## Preparing necessary applications

- Install `Windows Assessment and Deployment Kit (ADK)` (select only deployment tools) and 
`ADK Windows PE Add-ons`.

- Use Windows Search to open `Deployment and Imaging Tools Environment` as an administrator.

- Run this command:

```cmd
cd "..\Windows Preinstallation Environment\amd64"
copype amd64 "%userprofile%\Downloads\WinPE_amd64"
MakeWinPEMedia /UFD %userprofile%\Downloads\WinPE_amd64 P: /bootex
```
