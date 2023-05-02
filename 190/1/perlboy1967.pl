#!/usr/bin/env perl

use v5.36;
use warnings;

use Test::More;

sub captitalDetection {
  return ($_[0] =~ m#^([A-Z][a-z]+|[a-z]+|[A-Z]+)$# ? 1 : 0);
}

is(captitalDetection('Perl'),1);
is(captitalDetection('TPF'),1);
is(captitalDetection('PyThon'),0);
is(captitalDetection('raku'),1);

done_testing;
