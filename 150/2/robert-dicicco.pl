#!/usr/bin/env perl
use v5.36;

use ntheory qw/ factor /;

my @sqfnums = ();

foreach my $num (1..500){
  my @facs = factor($num);
  my $retval = SquareFree (@facs);
  if($retval > 0){
    push(@sqfnums, $num);
  }
}

say "@sqfnums ";

sub SquareFree {
  my %dvals = ();
  foreach my $val (@_){
    if (! exists($dvals{$val})){
      $dvals{$val} = 1;
    } else {
      return -1;
    }
  }

  return 1;
}
