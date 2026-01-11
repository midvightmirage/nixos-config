{ config, pkgs, ... }:

{
  environment.variables =
  {
    RUSTICL_ENABLE = "radeonsi";
    IDEA_PROPERTIES = "-Dswing.aatext=true -Dsun.j";
    _JAVA_OPTIONS = "--enable-native-access=ALL-UNNAMED";
  };
}
