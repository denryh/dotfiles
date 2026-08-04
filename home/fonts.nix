{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.geist-mono
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
  ];
}
