#!/usr/bin/env bash

nix eval --impure --expr '(import ./test.nix {})'
