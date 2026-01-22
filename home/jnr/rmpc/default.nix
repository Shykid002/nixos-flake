{ pkgs, ... }:

{
  home.packages = [ pkgs.rmpc pkgs.mpc ];

  xdg.configFile."rmpc/config.ron".text = ''
    (
      address: "127.0.0.1:6600",
      theme: "default",
      volume_step: 5,
      show_album_art: true,
    )
  '';
}

