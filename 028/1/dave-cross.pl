#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

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
