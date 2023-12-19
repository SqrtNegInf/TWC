#!/usr/bin/env perl

use v5.32;
use feature qw(signatures);

use common::sense;

use Test2::V0 -srand => 247;

use List::Util qw(shuffle);

sub nameSort {
  my @a = split(/\s+/,$a);
  my @b = split(/\s+/,$b);
  return $a[1] cmp $b[1] || $a[0] cmp $b[0];
}

sub secretSanta(@names1) {
  my @names2 = shuffle @names1;
  my @assignments;

  while (my $name1 = shift(@names1)) {
    my ($lastname1) = $name1 =~ m#(\S+)$#;
    if ($#names2 > 1) {
      while ($names2[0] =~ m#(\S+)$# and $lastname1 eq $1) {
        push(@names2,shift @names2);
      }
    }
    push(@assignments,sprintf("%s -> %s",$name1,shift @names2));
  }     

  [sort nameSort @assignments]; 
}

is(secretSanta(
     'Mr. Wall',
     'Mrs. Wall',
     'Mr. Anwar',
     'Mrs. Anwar',
     'Mr. Conway',
     'Mr. Cross',
   ), 
   [
     'Mr. Anwar -> Mr. Cross',
     'Mrs. Anwar -> Mrs. Wall',
     'Mr. Conway -> Mr. Wall',
     'Mr. Cross -> Mrs. Anwar',
     'Mr. Wall -> Mr. Conway',
     'Mrs. Wall -> Mr. Anwar', 
   ]
);

is(secretSanta(
     'Mr. Wall',
     'Mrs. Wall',
     'Mr. Anwar',
   ),
   [
    'Mr. Anwar -> Mrs. Wall',
    'Mr. Wall -> Mr. Anwar',
    'Mrs. Wall -> Mr. Wall', 
   ]
);

done_testing;
