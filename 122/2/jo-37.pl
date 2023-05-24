#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util 'forcomp';

# The task is to list all compositions of N where each part is limited
# to p <= 3.

forcomp {say "@_"} 4, {amax => 3};
