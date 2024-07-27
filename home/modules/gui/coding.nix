{pkgs, ...}: {
  home.sessionVariables = {
    SASS_PATH = "${pkgs.dart-sass}/bin/dart-sass";
  };
  home.packages = with pkgs; [
    sassc
    zed-editor
    thefuck
    cmake
  ];
}
