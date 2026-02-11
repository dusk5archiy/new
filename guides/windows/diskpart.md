# How to use Diskpart

## Open

Open `cmd` with Administrator rights, then run:

```cmd
diskpart
```
```
```

## Selecting a disk

To see available disks, run in Diskpart:

```cmd
list disk
```

To select disk number `1`, run:

```cmd
select disk 1
```

### Create a new paritition

To create a new partition on a disk, you
first select the disk, then run the following command (based on
your needs):

- If you want to create a partition that uses the rest space of the disk:

For primary partitions:

```cmd
create partition primary
```

For EFI partitions:

```cmd
create partition efi
```

- If you want to specify the size of the disk (in MB), 8000 MB for example, then add `size=8000` to to the command,
for example:

```cmd
create partition primary size=8000
```


## Selecting a partition of a disk

Before beginning, you must select a disk that contains the partition.

To see the partitions of the disk, run in Diskpart:

```cmd
list partition
```

To select partition number `1`, run:

```cmd
select partition 1
```

### Format a partition

Select the partition to format, then run one of these command based on your needs:

- To format a partition with NTFS format:

```cmd
format quick fs=ntfs
```

- Or, with FAT32 format (this must be used for EFI partitions)

```cmd
format quick fs=fat32
```

### Assign drive letter

To assign a letter to a partition, first select the partition, then run this command:

```cmd
assign letter=S
```

You can replace `S` with any available letter.

### Deleting a partition

To delete a partition, select that partition then run the following command:

```cmd
delete partition
```
```
