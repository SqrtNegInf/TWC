#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';

sub happy_number {
  my $number = my $start = shift;

  my %seen;
  until ($number == 1) {
    my $new_number = sum map { $_**2 } split //, $number;
    return if $seen{$new_number}++;
    $number = $new_number;
  }

  return 1;
}

my $found = 0;
for (my $i = 0; $found < 8; $i++) {
  if (happy_number($i)) {
    $found++;
    say $i;
  }
}

use Test::More;

ok happy_number(19), '19 is a happy number';
ok !happy_number(4), '4 is a sad number :(';

done_testing;
