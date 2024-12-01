#!/usr/bin/env bash

nix eval --impure --expr '(import ./day1.nix {}).main'
