{
  inputs,
  pkgs
}: {
  talhelper = inputs.talhelper.packages.${pkgs.system}.default;
}