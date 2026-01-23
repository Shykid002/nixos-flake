{ inputs, pkgs, ... }: {
  imports = [ ./audio.nix ./user.nix ./impermanence.nix #./stylix.nix
];

  
  
  environment.systemPackages = with pkgs; [
    cloudflare-warp
    libcxxStdenv
    clang
    gcc
    git
    curl
    neovim
    unzip
    nixd
    libnotify
    kitty
    xorg.xrdb
    st
  ];

  fonts.packages = [
    pkgs.dejavu_fonts
    pkgs.nerd-fonts.symbols-only
    pkgs.nerd-fonts.iosevka-term-slab
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  programs.hyprland.enable = true;

  nixpkgs.config.allowUnfree = true;
  

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = { experimental-features = [ "nix-command" "flakes" ]; };
  };

  services.gvfs.enable = true;
  programs.nano.enable = false;
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };

  #services.udev.extraRules = ''
  #  SUBSYSTEM=="pci", DRIVER=="amdgpu", ATTR{power_dpm_force_performance_level}="high"
  #'';
}
