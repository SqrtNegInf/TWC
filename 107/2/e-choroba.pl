#!/usr/bin/env perl
use v5.36;

use lib '.';
use Calc ();

say for sort keys %{Calc::};

# Inlining the package in the main file excludes the BEGIN. Not
# specifying the "no import ()" adds "import" to the list.
