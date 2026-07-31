{ ... }:

{
  imports = [
    ./packages.nix
    ./git.nix
    ./zsh.nix
  ];

  home.username = "henry";
  home.homeDirectory = "/home/henry";

  home.stateVersion = "25.11";
}
