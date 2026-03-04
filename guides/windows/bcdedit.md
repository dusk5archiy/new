# bcdedit

- This is done in `MSYS2` with admin rights.

## How to view an EFI partition

- Assign a letter to the EFI partition using `diskpart` (with admin rights), assume that it is `S`.
- View bcd on that EFI partition: 

```bash
bcdedit -store /s/efi/microsoft/boot/bcd
```

The output might look like this:

```txt
Windows Boot Manager
--------------------
identifier              {bootmgr}
device                  partition=S:
path                    \EFI\Microsoft\Boot\bootmgfw.efi
description             Windows Boot Manager
locale                  en-us
inherit                 {globalsettings}
default                 {default}
resumeobject            {33058841-e7b5-11f0-bc33-e606ce7f8363}
displayorder            {default}
toolsdisplayorder       {memdiag}
timeout                 30

Windows Boot Loader
-------------------
identifier              {default}
device                  vhd=[I:]\Windows\vdisk\windows-11.vhdx
path                    \Windows\system32\winload.efi
description             Windows 11
locale                  en-us
inherit                 {bootloadersettings}
isolatedcontext         Yes
allowedinmemorysettings 0x15000075
osdevice                vhd=[I:]\Windows\vdisk\windows-11.vhdx
systemroot              \Windows
resumeobject            {33058841-e7b5-11f0-bc33-e606ce7f8363}
nx                      OptIn
bootmenupolicy          Standard
```

- Assume that you have installed Windows in `/v/windows`.
- Add the system in `/v` to the EFI partition:

```bash
bcdboot v:\\windows -s s: -f uefi
```

## How to delete an entry

```bash
bcdedit -store /s/efi/microsoft/boot/bcd -delete {identifier}
```
