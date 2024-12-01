{ pkgs ? import <nixpkgs> { } }:
let
  inherit (pkgs) lib;
  inherit (lib) runTests;
  day1 = import ./day1.nix { };
in runTests {
  test_sortList = {
    expr = day1.sortList [ 1 3 5 2 4 ];
    expected = [ 1 2 3 4 5 ];
  };

  test_computeDistanceList = {
    expr = day1.computeDistanceList [ 1 2 3 4 5 ] [ 3 4 7 4 5 ];
    expected = [ 2 2 4 0 0 ];
  };

  test_computeDistanceList_mixed = {
    expr = day1.computeDistanceList [ 1 3 89 ] [ 1 2 94 ];
    expected = [ 0 1 5 ];
  };

  test_sum = {
    expr = day1.sum [ 1 2 3 4 5 ];
    expected = 5 * 6 / 2;
  };

  test_similarityElement = {
    expr = day1.similarityElement 3 [ 4 3 5 3 9 3 ];
    expected = 9;
  };

  test_similarity = {
    expr = day1.similarity [ 3 4 2 1 3 3 ] [ 4 3 5 3 9 3 ];
    expected = 31;
  };
}

