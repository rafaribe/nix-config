{ pkgs, ... }:
let
  nfsMounts = [
    { mountPoint = "/mnt/storage-0/onedrive-rafa"; serverPath = "truenas:/mnt/storage-0/onedrive-rafa"; }
    { mountPoint = "/mnt/storage-0/virtual-machines"; serverPath = "truenas:/mnt/storage-0/virtual-machines"; }
    { mountPoint = "/mnt/storage-0/talos"; serverPath = "truenas:/mnt/storage-0/talos"; }
    { mountPoint = "/mnt/storage-0/media"; serverPath = "truenas:/mnt/storage-0/media"; }
    { mountPoint = "/mnt/storage-0/docs"; serverPath = "truenas:/mnt/storage-0/docs"; }
    { mountPoint = "/mnt/storage-0/config"; serverPath = "truenas:/mnt/storage-0/config"; }
    { mountPoint = "/mnt/storage-0/minio"; serverPath = "truenas:/mnt/storage-0/minio"; }
    { mountPoint = "/mnt/storage-0/syncthing"; serverPath = "truenas:/mnt/storage-0/syncthing"; }
    { mountPoint = "/mnt/storage-0/photos"; serverPath = "truenas:/mnt/storage-0/photos"; }
    { mountPoint = "/mnt/storage-0/pc-backups"; serverPath = "truenas:/mnt/storage-0/pc-backups"; }
    { mountPoint = "/mnt/storage-0/mealie"; serverPath = "truenas:/mnt/storage-0/mealie"; }
    { mountPoint = "/mnt/storage-0/background-images"; serverPath = "truenas:/mnt/storage-0/background-images"; }
    { mountPoint = "/mnt/storage-0/time-machine"; serverPath = "truenas:/mnt/storage-0/time-machine"; }
    { mountPoint = "/mnt/storage-0/google-drive-rafa"; serverPath = "truenas:/mnt/storage-0/google-drive-rafa"; }
    { mountPoint = "/mnt/storage-0/google-photos-rafa"; serverPath = "truenas:/mnt/storage-0/google-photos-rafa"; }
    { mountPoint = "/mnt/storage-0/dropbox"; serverPath = "truenas:/mnt/storage-0/dropbox"; }
    { mountPoint = "/mnt/storage-0/porn"; serverPath = "truenas:/mnt/storage-0/flakes"; }
  ];
in
{
  fileSystems = builtins.listToAttrs (map (mount: {
    name = mount.mountPoint;
    value = {
      device = mount.serverPath;
      fsType = "nfs";
    };
  }) nfsMounts);
}
