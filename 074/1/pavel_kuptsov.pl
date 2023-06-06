#!/usr/bin/env perl
use v5.36;

use Test::More;
use POSIX qw(floor);

my @A = (1, 2, 2, 3, 2, 4, 2);
my @B = (1, 3, 1, 2, 4, 5);

sub majority_el
{
  my $arr_ref = shift;
  my $o = {};
  map { $o->{$_}++ } @$arr_ref;
  my ($max) = sort { $o->{$b} <=> $o->{$a} } keys %$o;

  return $o->{$max} >= floor(@$arr_ref/2) ? $max : -1;
}

ok(majority_el(\@A) == 2 );
ok(majority_el(\@B) == -1);

done_testing(2);
