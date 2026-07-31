{
  description = "Dat's development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wezterm.url = "github:wezterm/wezterm?dir=nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, ...}:
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

	extraSpecialArgs = { inherit inputs; };

        modules = [
          ./home/home.nix
	  {
      	    home.username = "henry";
      	    home.homeDirectory = "/home/henry";
    	  }
        ];
      };
    };
}
