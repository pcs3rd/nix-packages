#     nix-build -A mypackage
{pkgs ? import <nixpkgs> {}}: {
  wallpaper-lakeside = pkgs.callPackage ./packages/wallpapers/gnome/lakeside {};
}

