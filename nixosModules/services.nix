{ config, pkgs, ... }:

  /*
   * File Path: ./nixosModules/services.nix --- File Type: Module
   * ------------------------------------------------------------
   * This module declares the services for the system to install.
   */

{

  /* Services */
  services =
  {
      fprintd.enable = true;
      fwupd.enable = true;
      #
      /* XServer Service */
      xserver =
      {
        enable = true;
        videoDrivers = [ "amdgpu" ];
        xkb =
        {
          layout = "de";
          variant = "";
        };
        #
        libinput.enable = true;
        displayManager.sddm.enable = true;
        desktopManager.plasma6 = { enable = true; };
      };
      #
      printing.enable = true;
      pulseaudio.enable = false;
      #
      /* Pipewire Service */
      pipewire =
      {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
      };
      /* Mumble Murmur Server */
      murmur =
      {
        enable = true;
        openFirewall = true;
      };
      emacs =
      {
        enable = true;
        startWithGraphical = true;
        # defaultEditor = true;
      };
      #
    /* SSH Daemon */
 /* services.openssh.enable = true;
  * services.openssh.settings =
  * {
  *   permitRootLogin = "no";
  *   passwordAuthentication = false;
  *   kbdInteractiveAuthentication = false;
  * };
  */

    /* SearXNG */
 /* searx =      #TODO: Find out how to declare and configure this properly.
  * {
  *   enable = true;
  *   redisCreateLocally = true;
  *   settings.server =
  *   {
  *     bind_address = "::1";
  *     # port = yourPort;
  *     # WARNING: setting secret_key here might expose it to the nix cache
  *     # see below for the sops or environment file instructions to prevent this
  *     # secret_key = "Your secret key.";
  *   };
  * };
  */
  };
  security.rtkit.enable = true;

  /*VirtualBox Configuration*/
  virtualisation.virtualbox =
  {
    host =
    {
      enable = true;
      enableKvm = true;
      enableHardening = true;
      enableWebService = true;
      # enableExtensionPack = true;
      # addNetworkInterface = {
      #   interface = "vboxnet0";
      #   ip = "192.168.56.1";
      #   netmask = "24";
      # };
    };
    guest =
    {
      enable = true;
      use3rdPartyModules = true;
      verbose = true;
      vboxsf = true;
      seamless = true;
      dragAndDrop = true;
      clipboard = true;
    };
  };
}
