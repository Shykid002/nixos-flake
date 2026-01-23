{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system

    (import ../../lib/disko.nix {
      device = "/dev/sda";
      swapSize = "4G";
    })
    inputs.disko.nixosModules.default
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  #boot.initrd.kernelModules = [ "i915" ];
  boot.kernelModules = [ ];
  hardware.firmware = [ "intel-ucode" ];
  services.acpid.enable = true;


  networking.hostName = "jnr";
  i18n.defaultLocale = "en_US.UTF-8";

  # Set your time zone.
  time.timeZone = "Africa/Lagos";

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  # don't change it, even if you update nixos.
  system.stateVersion = "24.11"; # Did you read the comment?

}
