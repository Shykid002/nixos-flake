{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Shykid002";
    userEmail = "Shykid002@gmail.com";
  };

  # home.persistence."/nix/persist/home/jnr" = {
  #   directories = [
  #     ".config/gh"
  #   ];
  # };
  home.packages = with pkgs; [ gh lazygit ];
}
