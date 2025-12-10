{
  config,
  pkgs,
  ...
}: {
  programs.direnv = {
    enable = true;
  };
  # Note: clone git repos with `jj git clone <url>`
  # jj bookmark create
  # jj bookmark track <branch>@origin
  # jj bookmark set <current branch> -r @
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
