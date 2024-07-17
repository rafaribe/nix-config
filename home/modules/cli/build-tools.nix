
{pkgs, ...}: {
  home.packages = with pkgs; [
    lldb_18
    llvm_18
  ];
}
