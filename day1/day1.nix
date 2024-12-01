{ pkgs ? import <nixpkgs> { } }: rec {
  lib = pkgs.lib;
  main = parseFile;
  parseFile = let
    inputContent = builtins.readFile ./input.txt;
    pairListUnclean = lib.splitString "\n" inputContent;
    pairList =
      builtins.filter (line: line != "") pairListUnclean; # [ "1   2", "3   4"]

    firstListStr =
      builtins.map (pair: builtins.elemAt (lib.splitString "   " pair) 0)
      pairList;
    firstList = builtins.map (el: lib.toInt el) firstListStr;

    secondListStr =
      builtins.map (pair: builtins.elemAt (lib.splitString "   " pair) 1)
      pairList;
    secondList = builtins.map (el: lib.toInt el) secondListStr;

  in {
    inherit firstList;
    inherit secondList;
  };
}
