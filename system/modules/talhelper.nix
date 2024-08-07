{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.talhelper.packages.${pkgs.system}.default
  ];
}
