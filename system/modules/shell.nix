{pkgs, ...}: {
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [zsh];
  environment.variables = {
    EDITOR = "nvim";
    TERMINAL = "kitty -1";
    TERM = "xterm-kitty";
  };

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = ["${XDG_BIN_HOME}"];
    TALOSCONFIG = "/home/rafaribe/code/rafaribe/home-ops/kubernetes/main/bootstrap/talos/clusterconfig/talosconfig";
    SOPS_AGE_KEY_FILE = "/home/rafaribe/.config/sops/age/keys.txt";
  };

  environment.systemPackages = with pkgs; [
    kitty
    zsh
    zsh-syntax-highlighting
    ripgrep
    eza
    keychain
    zoxide
    fira-code
    pass
    pinentry-tty
    bat-extras.batman
    bat-extras.batwatch
    tmux
    cmatrix
    sysz
    systemctl-tui
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-tty;
  };

  # required for root user
  programs.zsh.enable = true;
}
