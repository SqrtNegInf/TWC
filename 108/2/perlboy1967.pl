#!/usr/bin/env perl
use v5.36;

# To have integer results over nB > 26 on my machine:
use bigint;

my $nB = shift // 10;

my @bn = (1,1);
my @bnT = map {[$_]} @bn;

if ($nB > 2) {
  foreach (2 .. $nB-1) {
    # Add row
    push(@bnT,[0]);

    # Copy
    $bnT[-1][0] = $bnT[-2][-1];
    foreach (1 .. scalar(@{$bnT[-2]})) {
      # Add
      $bnT[-1][$_] =  
        $bnT[-2][$_-1] +  
        $bnT[-1][$_-1];
    }

    push(@bn,$bnT[-1][-1]);
    shift(@bnT);
  } 
}

# Print
my $i = 0;
printf "%s\n", join("\n",map{++$i; "$i: $_"} @bn[0 .. $nB-1]);
