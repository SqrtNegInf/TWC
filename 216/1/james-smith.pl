#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);
use Test::More;

my @TESTS = (
 [ ['AB1 2CD', qw(abc   abcd  bcd  )], 'abcd'      ],
 [ ['007 JB',  qw(job   james bjorg)], 'job bjorg' ],
 [ ['C7 RA2',  qw(crack road  rac  )], 'crack rac' ],
);

sub reg_number {
  my (%l,%x) = map { /[a-z]/ ? ($_=>1) : () }
               split //,
               lc
               shift;
  grep {
    %x=%l;
    delete $x{$_} for split//;
    !%x;
  } @_
}

is( "@{[ reg_number( @{$_->[0]} ) ]}", $_->[1] ) for @TESTS;

done_testing();
