{ config, pkgs, services, ... }:

  /*
   * File Path: ./nixosModules/variables.nix --- File Type: Module
   * --------------------------------------------------------------------------------
   * This module declares the variables for the system and installed packages to use.
   */

{
  /* Environment Variables */
  environment.variables =
  {
    DRI_PRIME = "1!";
    RUSTICL_ENABLE = "radeonsi";
    IDEA_PROPERTIES = "-Dswing.aatext=true -Dsun.j";
    _JAVA_OPTIONS = "--enable-native-access=ALL-UNNAMED";
  };
}
