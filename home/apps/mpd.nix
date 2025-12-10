{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    rmpc
    mpc
    mpd
    mpd-mpris
    music-discord-rpc
  ];
  home.file.".config/rmpc" = {
    source = ./config/rmpc;
    executable = true;
  };
  home.file.".config/mpd/mpd.conf".text = ''
    music_directory "~/Music"
    playlist_directory "~/Music"
    db_file "~/.config/mpd/database"
    log_file "~/.config/mpd/log"
    pid_file "~/.config/mpd/pid"
    state_file "~/.config/mpd/state"
    audio_output {
        type "pipewire"
        name "Pipewire Playback"
    }
    auto_update "yes"
    bind_to_address "127.0.0.1"
    port "6600"
    restore_paused "yes"
  '';
  xdg.configFile = {
    # Apps
    "autostart/mpd.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=MPD
      Exec=mpd ${config.xdg.configHome}/mpd/mpd.conf
    '';
    "autostart/mpd-mpris.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Mpris for MPD
      Exec=bash -c "until ${pkgs.mpc}/bin/mpc > /dev/null 2>&1; do sleep 1; done; exec mpd-mpris"
    '';
    "autostart/mpris-discord-rpc.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Mpris Discord
      Exec=music-discord-rpc
    '';
  };
}
