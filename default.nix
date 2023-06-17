#     nix-build -A mypackage
{pkgs ? import <nixpkgs> {}}: {
  lakeside-wallpaper = pkgs.callPackage ./packages/wallpapers/gnome/lakeside {};
  lakeside-2-wallpaper = pkgs.callPackage ./packages/wallpapers/gnome/lakeside-2 {};
  firewatch-wallpaper = pkgs.callPackage ./packages/wallpapers/gnome/firewatch {};
}

