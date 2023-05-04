#!/usr/bin/env perl
use v5.36;

use Data::Printer;

use Test::More;
use Test::Deep qw(cmp_deeply);

sub trimList :prototype(\@$);

my @l = (9,0,6,2,3,8,5);
my $ar = [1,2,3,4,5];

# Test 1: 'wantarray'
my @l2 = trimList(@l,4);
cmp_deeply(\@l,[9,0,6,2,3,8,5]);
cmp_deeply(\@l2,[9,6,8,5]);

# Test 2a: Modify list by reference
trimList(@l,4);
cmp_deeply(\@l,[9,6,8,5]);

# Test 2b: Modify list by reference
trimList(@$ar,2);
cmp_deeply($ar,[3,4,5]);

done_testing();


sub trimList :prototype(\@$) {
  my ($ar,$v) = @_;

  if (wantarray) {
    grep { $_ > $v } @$ar;
  } else {
    @$ar = grep { $_ > $v } @$ar;
  }
}

