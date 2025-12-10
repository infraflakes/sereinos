{
  config,
  pkgs,
  lib,
  ...
}: {
  # Ghostty relies on system's opengl
  # install ghostty with distro's package manager
  # Is way more hassle free
  home.file.".config/ghostty/config".text = ''
    background = 1b1e25
    font-family = JetBrains Mono Nerd Font
    font-size = 13
    theme = Catppuccin Frappe
    keybind=clear
  '';
}
