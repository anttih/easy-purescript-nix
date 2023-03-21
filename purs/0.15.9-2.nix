{ pkgs ? import <nixpkgs> { }, system ? pkgs.stdenv.hostPlatform.system }:

let
  version = "v0.15.9-2";

  urls = {
    "x86_64-linux" = {
      url = "https://github.com/purescript/purescript/releases/download/${version}/linux64.tar.gz";
      sha256 = "sha256-XRbmSEnf9M9+YOhhaFSG4Am5SNvNQjnF/K0FgcHqGJo=";
    };
    "x86_64-darwin" = {
      url = "https://github.com/purescript/purescript/releases/download/${version}/macos.tar.gz";
      sha256 = "sha256-h+Aln/b8+50b1MnJHVvYLE2V8gFtt2kauhxKGczch0U=";
    };
    "aarch64-linux" = {
      url = "https://github.com/purescript/purescript/releases/download/${version}/linux-arm64.tar.gz";
      sha256 = "sha256-LyFn1JkbnHkDrFgiev2Ac9zM/LAyCHL4ez+93HKLxvo=";
    };
    "aarch64-darwin" = {
      url = "https://github.com/purescript/purescript/releases/download/${version}/macos-arm64.tar.gz";
      sha256 = "sha256-IvfJ80ck5qkfnuQRSCy9pPoGrMG3y4hBjt7zXwqpQ7s=";
    };
  };

  src =
    if builtins.hasAttr system urls then
      (pkgs.fetchurl urls.${system})
    else
      throw "Architecture not supported: ${system}";
in
import ./mkPursDerivation.nix {
  inherit pkgs version src;
}
