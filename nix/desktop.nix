{
  inputs,
  makeDesktopItem,
  ...
}:
makeDesktopItem {
  categories = [ "Game" ];
  desktopName = "Terminus Launcher";
  exec = "axolotl-launcher";
  icon = "${../apps/app/icons/icon.png}";
  mimeTypes = [
    "application/x-modrinth-modpack+zip"
    "x-scheme-handler/axolotl"
  ];
  name = "Terminus Launcher";
  startupWMClass = "Terminus Launcher";
  terminal = false;
  type = "Application";
}
