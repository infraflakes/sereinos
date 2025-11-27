{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.spicetify-nix.homeManagerModules.default];
  home.packages = with pkgs; [
    papers
    ffmpeg-full
    music-discord-rpc
    mpv
    ani-cli
    easytag
    nicotine-plus
    imv
    libnotify
  ];
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
      trashbin
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
