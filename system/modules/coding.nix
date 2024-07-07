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
    jdk
    python3
    ruff-lsp
    pyright
    cargo
    rustc
    rust-analyzer
    taplo # TOML language server
    marksman # markdown language server
    meld
    ansible
  ];

  programs.java.enable = true;
}
