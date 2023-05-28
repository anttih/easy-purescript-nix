{
  pkgs ? import <nixpkgs> {},
  system ? builtins.currentSystem,
  nodejs ? pkgs."nodejs-14_x",
}:

(import ./composition.nix {inherit pkgs nodejs system;})."spago-next"
