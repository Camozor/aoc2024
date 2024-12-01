{ pkgs ? import <nixpkgs> { } }: rec {
  lib = pkgs.lib;
  main = let
    lists = parseFile;
    firstList = sortList lists.firstList;
    secondList = sortList lists.secondList;
    distanceList = computeDistanceList firstList secondList;
    answer = sum distanceList;
    similarityAnswer = similarity firstList secondList;
  in {
    inherit answer;
    inherit similarityAnswer;
  };

  parseFile = let
    inputContent = builtins.readFile ./input.txt;
    pairListUnclean = lib.splitString "\n" inputContent;
    pairList =
      builtins.filter (line: line != "") pairListUnclean; # [ "1   2", "3   4"]

    createList = position:
      let
        list = builtins.map
          (pair: builtins.elemAt (lib.splitString "   " pair) position)
          pairList;
      in builtins.map (el: lib.toInt el) list;

    firstList = createList 0;
    secondList = createList 1;

  in {
    inherit firstList;
    inherit secondList;
  };

  sortList = list: builtins.sort builtins.lessThan list;

  computeDistanceList = firstList: secondList:
    let computeDistance = a: b: if a > b then a - b else b - a;
    in lib.zipListsWith computeDistance firstList secondList;

  sum = list: builtins.foldl' (x: y: x + y) 0 list;

  similarityElement = element: list:
    let filteredList = builtins.filter (e: e == element) list;
    in builtins.length filteredList * element;

  similarity = firstList: secondList:
    let countList = builtins.map (e: similarityElement e secondList) firstList;
    in sum countList;
}
