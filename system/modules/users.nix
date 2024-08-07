{...}: {
  users.users = {
    rafaribe = {
      isNormalUser = true;
      extraGroups = ["wheel" "video" "nginx" "docker"];
      homeMode = "750"; # for nginx to read assets
    };
  };

  security.sudo = {
    execWheelOnly = true;
    wheelNeedsPassword = true;
    extraConfig = ''
      Defaults        timestamp_timeout=600
    '';
  };
}
