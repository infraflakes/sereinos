{
  config,
  pkgs,
  ...
}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "infraflakes@proton.me";
        name = "infraflakes";
      };
    };
  };
}
