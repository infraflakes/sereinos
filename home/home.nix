{
  config,
  pkgs,
  inputs,
  username,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
    packages = [
      pkgs.htop
      pkgs.home-manager
      pkgs.ncdu
      pkgs.bottom
      pkgs.nmap
      pkgs.lsd
      pkgs.ripgrep
      pkgs.bat
      pkgs.jq
      inputs.srn-coreutils.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
  imports = [
    ./apps/vcs.nix
    ./apps/fish.nix
    ./apps/fastfetch.nix
    ./apps/nvim.nix
    ./apps/yazi.nix
    ./apps/tmux.nix
    ./apps/container.nix
    ./apps/fonts.nix
    #./apps/ollama.nix
    ./apps/misc.nix
  ];
}
