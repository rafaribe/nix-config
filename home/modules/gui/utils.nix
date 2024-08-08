{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    thunderbird
    rpi-imager
  ];
}
