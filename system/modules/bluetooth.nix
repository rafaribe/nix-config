{...}: let
  enable = true; # save energy until we need it
in {
  hardware.bluetooth = {
    enable = enable;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };
  services.blueman.enable = enable;
}
