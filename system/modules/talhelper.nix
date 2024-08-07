{
  inputs,
  pkgs ? import <nixpkgs> {},
}: {;
  talhelper = inputs.talhelper.packages.${pkgs.system}.default;
}