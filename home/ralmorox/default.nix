{ config, ... }:

{
  home.username = "ralmorox";
  home.homeDirectory = "/home/ralmorox";
  home.stateVersion = "26.11";

  programs.gh.enable = true;

  xdg.enable = true;

  xdg.configFile."hypr/hyprland.lua".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nix-config/home/ralmorox/hyprland.lua";
}
