{ pkgs ? import <nixpkgs> { }, system ? pkgs.stdenv.hostPlatform.system }:

let
  version = "v0.15.9-2";

  urls = {
    "x86_64-linux" = {
      url = "https://github.com/purescript/purescript/releases/download/${version}/linux64.tar.gz";
      sha256 = "1c32mlin1b57h4q38l3yp2iplmxb55y3w1v5fgr5pi049xrimf09";
    };
    "x86_64-darwin" = {
      url = "https://github.com/purescript/purescript/releases/download/${version}/macos.tar.gz";
      sha256 = "19gx4ywfgsg9i3lajkrynfzzcdxs6g6m6a7nxwp35vwhw4kfmvqi";
    };
    "aarch64-linux" = {
      url = "https://github.com/purescript/purescript/releases/download/${version}/linux-arm64.tar.gz";
      sha256 = "1qxiv92pv5925hlg1gw7hyvjx4ar4diwslxf298rydkw07z48wc5";
    };
    "aarch64-darwin" = {
      url = "https://github.com/purescript/purescript/releases/download/${version}/macos-arm64.tar.gz";
      sha256 = "1bq4xdxpy1wn4birrff7164s51y4kzyinghd0mbsyyz7b8iqaa6g";
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
