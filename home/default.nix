{ ... }:

{
  imports = [
    ./packages.nix
    ./git.nix
  ];

  home.username = "henry";
  home.homeDirectory = "/home/henry";

  home.stateVersion = "25.11";
}
