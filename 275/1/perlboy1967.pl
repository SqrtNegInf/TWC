#!/usr/bin/env perl

use v5.36;

use Test2::V0 -no_srand;

sub brokenKeys ($sentence,@keys) {
  my $re = '['.join('',@keys).']';
  scalar grep !/$re/i, split /\s+/, $sentence;
}

is(brokenKeys('Perl Weekly Challenge','l','a'),0);
is(brokenKeys('Perl and Raku','a'),1);
is(brokenKeys('Well done Team PWC','l','o'),2);
is(brokenKeys('The joys of polyglottism','T'),2);

done_testing;
