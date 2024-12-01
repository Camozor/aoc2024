{ pkgs ? import <nixpkgs> { } }:
let
  inherit (pkgs) lib;
  inherit (lib) runTests;
  day1 = import ./day1.nix { };
in runTests {
  someTest = {
    expr = 2 + 2 == 4;
    expected = true;
  };
}

