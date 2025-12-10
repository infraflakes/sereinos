{
  description = "Personal flake for FX507ZU4";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    srn-coreutils = {
      url = "github:infraflakes/srn-coreutils/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    srn-coreutils,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    username = "infraflakes";
    hostname = "serein";
  in {
    # Home Manager
    homeConfigurations."${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit username inputs;};
      modules = [./home/home.nix];
    };
    # Dev Shell
    devShells.${system} = {
      rs = import ./devshells/rs.nix {inherit pkgs;};
      go = import ./devshells/go.nix {inherit pkgs;};
      js = import ./devshells/js.nix {inherit pkgs;};
      py = import ./devshells/py.nix {inherit pkgs;};
      c = import ./devshells/c.nix {inherit pkgs;};
    };
  };
}
