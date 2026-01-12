{ pkgs, ... }:

let
  jetbrainsSettings =
  {
    vmopts =
    ''
      -Dsun.java2d.uiScale.enabled=true
      -Dsun.java2d.uiScale=1.35
      -Dswing.aatext=true
      -Xms512m
      -Xmx2048m
    '';
  };
in
{

  environment =
  {
    etc."jetbrains/idea.properties".text =
    ''
      idea.preferences.system.auto.save.enabled=true
      idea.preferences.system.backup.enabled=false
      idea.look.and.feel=com.intellij.ide.ui.laf.darcula.DarculaLaf
    '';

    systemPackages =
      let
        jb = pkgs.jetbrains;
      in
      [
        (jb.rider.override jetbrainsSettings)
        (jb.rust-rover.override jetbrainsSettings)
        (jb.ruby-mine.override jetbrainsSettings)
        (jb.pycharm.override jetbrainsSettings)
        (jb.webstorm.override jetbrainsSettings)
        (jb.phpstorm.override jetbrainsSettings)
        (jb.mps.override jetbrainsSettings)
        (jb.idea.override jetbrainsSettings)
        (jb.idea-oss.override jetbrainsSettings)
        (jb.clion.override jetbrainsSettings)
        (jb.goland.override jetbrainsSettings)
        (jb.dataspell.override jetbrainsSettings)
        (jb.datagrip.override jetbrainsSettings)
        (jb.gateway.override jetbrainsSettings)
      ];
  };
}
