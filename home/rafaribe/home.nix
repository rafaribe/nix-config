{
  inputs,
  pkgs,
  ...
}: {
  home = {
    username = "rafaribe";
    homeDirectory = "/home/rafaribe";
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  };

  # Imports
  imports = [
    ./apps
    #./cli-apps
   # ./desktop
  #  ./rice
   # ./system
  #  ./tools
    # ./virtualization
  ];

  # Allow unfree packages + use overlays
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Add support for .local/bin
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
