{ config, pkgs, ... }:

  /* ./configuration.nix */

{
  imports =
    [
      ./hardware-configuration.nix
      ./nixosModules/packages.nix
      ./nixosModules/services.nix
      ./nixosModules/variables.nix
      /* ./nixosModules/scripts.nix */

      ./nixosModules/home-manager.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "vm.swappiness=1" "amdgpu.modeset=1" ];
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";

/* Locale Settings */
i18n.extraLocaleSettings =
  let
    locale = "de_DE.UTF-8";
  in
  {
    defaultLocale = "en_GB.UTF-8";
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    LC_TIME = locale;
  };

  /* User Settings */
  users.users.madeline =
  {
    isNormalUser = true;
    description = "Madeline";
    extraGroups = [ "networkmanager" "wheel" "render" "video"];
  };

  /* NixPKGs Settings */
  nixpkgs.config =
  {
    allowUnfree = true;
    rocmSupport = true;
  };

  /* Hardware Settings */
  hardware.graphics =
  {
    enable = true;
    extraPackages = with pkgs;
    [
      mesa.opencl
      rocmPackages.clr.icd
    ];
  };

  # System Version
  system.stateVersion = "25.11";
}
