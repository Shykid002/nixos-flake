{ config, pkgs, user, ... }:

{
  services.mpd = {
    enable = true;

    musicDirectory = "/home/${user}/Music";
    playlistDirectory = "/home/${user}/.config/mpd/playlists";
    dataDir = "/home/${user}/.local/share/mpd";
    network.listenAddress = "127.0.0.1";
    network.port = 6600;

    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };

  # Optional but recommended
  services.mpd-mpris.enable = true;
}

