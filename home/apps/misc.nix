{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ffmpeg-full
    ani-cli
  ];
}
