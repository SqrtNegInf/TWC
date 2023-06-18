#!/usr/bin/env perl
use v5.36;

use File::Basename;

for ($0) {
  if (-T) {
    say "$_ looks like a text file";
  } elsif (-B) {
    say "$_ looks like a binary file";
  } else {
    say "$_ looks a bit weird";
  }
}
