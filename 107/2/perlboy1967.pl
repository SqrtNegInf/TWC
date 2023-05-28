#!/usr/bin/env perl
use v5.36;

BEGIN {
  use File::Basename qw(dirname);
  use lib dirname($0);
}

@ARGV = ('Calc')
  unless (scalar(@ARGV) > 0);

my ($lib, $evade) = @ARGV;

eval "use $lib";
die $@ if ($@);


if ($evade // 0) {
  # Sneak dynamically a new method in...
  eval sprintf q(sub %s::thatIsAllFolks { print "That\'s all folks!\n" }), $lib;
}

# Code taken from:
# https://stackoverflow.com/questions/910430/how-do-i-list-available-methods-on-a-given-object-or-package-in-perl
use v5.36;

no strict 'refs';

printf "methods = ('%s')\n",  
       join("','", grep {defined &{"${lib}::$_"} } sort keys %{"${lib}::"});

if ($evade // 0) {
  &{"${lib}::thatIsAllFolks"}();
}

use strict 'refs';
