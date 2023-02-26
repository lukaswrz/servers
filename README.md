# servers

## Disk setup with labels

### Boot

```bash
mkfs.vfat -F 32 -n BOOT $bootpart
```

### Swap

```bash
mkswap -L swap $swappart
swapon $swappart
```

### Root

```bash
mkfs.btrfs -fL root $rootpart

mount $rootpart /mnt

btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/nix

umount /mnt

mount -o subvol=root,compress=zstd,noatime $rootpart /mnt

mkdir /mnt/home
mount -o subvol=home,compress=zstd,noatime $rootpart /mnt/home

mkdir /mnt/nix
mount -o subvol=nix,compress=zstd,noatime $rootpart /mnt/nix

mkdir /mnt/boot
mount $bootpart /mnt/boot
```
