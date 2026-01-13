{ pkgs, lib, config, ... }:

    /*
     * File Path: ./nixosModules/packages.nix --- File Type: Module
     * ------------------------------------------------------------
     * This module declares the packages for the system to install.
     */

{
  imports =
  [
  /* <nixpkgs/nixos/modules/programs/plasma-manager.nix> */
  ./packages/overrides.nix
  ./packages/defaults.nix
  ./packages/entries.nix
  ];

  /* List packages installed in system profile. To search, run ' nix search wget ' */

  environment.systemPackages = with pkgs;
  [
    pkgs.home-manager
    #
    # Basic Utilities
    framework-tool
    kdePackages.plasma-integration
    rocmPackages.rocminfo
    nvtopPackages.amd
    rustup
    clinfo
    btop
    hyfetch
    vim
    wget
    git
    visualvm
    jprofiler
    #
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.de_DE
    hyphenDicts.en_US
    hyphenDicts.de_DE
  ];

  users.users.madeline.packages = with pkgs;
  [
    /* General Purpose */
    kdePackages.kate
    floorp-bin
    tor-browser
    legcord
    obsidian
    gparted
    thunderbird-esr
    pidgin
    mumble
    mumble_overlay
    #
    /* Privacy */
    #
    /* Security */
    #
    /* Misc/Other */
    warp-plus
    /* Misc/Research */
    wireshark
    #
    /* Programming/Development */
    jetbrains.rider
    jetbrains.rust-rover
    jetbrains.ruby-mine
    jetbrains.pycharm
    jetbrains.webstorm
    jetbrains.phpstorm
    jetbrains.mps
    (jetbrains.plugins.addPlugins pkgs.jetbrains.idea [ "nixidea" ])
    (jetbrains.plugins.addPlugins pkgs.jetbrains.idea-oss [ "nixidea" ])
    jetbrains.clion
    jetbrains.goland
    jetbrains.dataspell
    jetbrains.datagrip
    jetbrains.gateway
    warp-terminal
    vscodium
    #
    #pkgs.winboat
    #
    /* Content Creation */
    bitwig-studio
    davinci-resolve
    manuskript
    krita
    #
    gpu-screen-recorder-gtk
    #affinity studio
    blender
    blockbench
    godot
    # obs
    #
    /* Content Consumption / General */
    /* Music */
    # music app here
    /* Games */
    steam
    adwsteamgtk
    r2modman
    protonup-qt
    prismlauncher
    # thunderbird
    # firefox
  ];

  programs =
  {
    steam =
    {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ]; # doesnt work
    };
    wireshark.enable = true;
    java =
    {
      enable  = true;
      package = pkgs.openjdk21;
    };
    nix-ld =
    {
      enable = true;
      libraries = with pkgs;
      [
        gtk3
        glib
        libGL
        xorg.libX11
        xorg.libXtst
        xorg.libXxf86vm
        xorg.libXext
        libglvnd
      ];
    };
  };
}
