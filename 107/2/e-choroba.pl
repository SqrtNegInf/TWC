#!/usr/bin/env perl
use warnings;
use strict;
use feature qw{ say };

use lib '.';
use Calc ();

say for sort keys %{Calc::};

# Inlining the package in the main file excludes the BEGIN. Not
# specifying the "no import ()" adds "import" to the list.
