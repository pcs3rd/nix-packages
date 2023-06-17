#     nix-build -A mypackage
{pkgs ? import <nixpkgs> {}}: {
  git-credential-manager = pkgs.callPackage ./pkgs/git-credential-manager {};
  github-linguist = pkgs.callPackage ./pkgs/github-linguist {};
  pkcs11-provider = pkgs.callPackage ./pkgs/pkcs11-provider.nix {};
  sea-orm-cli = pkgs.callPackage ./pkgs/sea-orm-cli {};
}

