{
  description = "Dat's development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          zsh
          ripgrep
        ];
      };

      homeConfigurations.henry = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home/default.nix
        ];
      };
    };
}
