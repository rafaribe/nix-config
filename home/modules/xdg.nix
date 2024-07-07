{...}: {
  for electron apps
  home.sessionVariables.DEFAULT_BROWSER = "brave-browser.desktop";

  xdg.mimeApps = {
    enable = true;
    defaultApplications = let
      browser = "brave-browser.desktop";
    in {
      "text/html" = browser;
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "x-scheme-handler/about" = browser;
      "x-scheme-handler/unknown" = browser;
    };
  };
}
