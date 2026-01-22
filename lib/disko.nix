{ device ? "/dev/sda", ... }:

{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = device;

      content = {
        type = "gpt";
        partitions = {
          # EFI (reuse sda2)
          esp = {
            name = "ESP";
            start = "1MiB";
            end = "1025MiB";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot/efi";
            };
          };

          # Swap (reuse sda3)
          swap = {
            size = "4G";
            content = { type = "swap"; };
          };

          # Root (reuse sda4)
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ]; # FORCE wipe Arch
              subvolumes = {
                "@root" = { mountpoint = "/"; };

                "@home" = { mountpoint = "/home"; };

                "@nix" = { mountpoint = "/nix"; };

                "@log" = { mountpoint = "/var/log"; };

                "@cache" = { mountpoint = "/var/cache"; };

                "@tmp" = { mountpoint = "/var/tmp"; };
              };
            };
          };
        };
      };
    };
  };
}

