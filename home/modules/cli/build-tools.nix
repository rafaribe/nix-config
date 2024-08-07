{pkgs, ...}: {
  imports = [
    <nix-ld/modules/nix-ld.nix>
  ];
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    lldb_18
    llvm_18
  ];
  home.packages = with pkgs; [
  ];
}
