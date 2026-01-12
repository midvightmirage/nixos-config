{ config, pkgs, ... }:

{
  services =
  {
  fprintd.enable = true;
  fwupd.enable = true;
  xserver.enable = true;
  xserver.videoDrivers = [ "amdgpu" ];
  displayManager.sddm.enable = true;
  desktopManager.plasma6.enable = true;
  xserver.xkb =
  {
    layout = "de";
    variant = "";
  };
  libinput.enable = true;
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire =
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

  # SSH Daemon (uncomment if needed)
  # services.openssh.enable = true;
  # services.openssh.settings =
  # {
  #   permitRootLogin = "no";
  #   passwordAuthentication = false;
  #   kbdInteractiveAuthentication = false;
  # };
  };
}
