{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/desktop
  ];

  networking.hostName = "aether";

  home-manager.users.ralmorox = { config, ... }: {
    imports = [
      ../../home/ralmorox
    ];

    xdg.configFile."hypr/host.lua".source =
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nix-config/hosts/aether/hyprland.lua";
  };

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };

    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  fileSystems."/".options = [ "compress=zstd:3" ];
  fileSystems."/home".options = [ "compress=zstd:3" ];
  fileSystems."/nix".options = [ "compress=zstd:3" "noatime" ];

  system.stateVersion = "26.11";
}
