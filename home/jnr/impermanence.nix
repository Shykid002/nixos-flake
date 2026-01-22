{ inputs, user, ... }: {
  imports = [ inputs.impermanence.homeManagerModules.impermanence ];
  home.persistence."/nix/persist/home/${user}" = {
    directories = [
      "dev"
      "pix"
      "Desktop"
      "Videos"
      "Music"
      "Pictures"
      "Downloads"
      ".mozilla"
      ".ssh"
      ".local"
      ".config"
      ".cache"

    ];
    files = [ ];
    allowOther = true;
  };
}
