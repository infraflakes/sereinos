{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    podman
  ];
  home.file.".config/containers/policy.json".text = ''
    {
      "default": [{ "type": "insecureAcceptAnything" }]
    }
  '';
}
