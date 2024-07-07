{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim
    git
    lazygit
    gh
    gcc
    gnumake
    nodejs
    go
    cargo
    tree-sitter
    python3
    pyright
    cargo
    rustc
    rust-analyzer
    taplo # TOML language server
  ];

  programs.java.enable = true;
}
