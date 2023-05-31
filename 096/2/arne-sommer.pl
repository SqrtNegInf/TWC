#!/usr/bin/env perl
use v5.36;

use List::Util 'min';

my $S1 = shift(@ARGV) // 'kitten';
my $S2 = shift(@ARGV) // 'sitting';

say wagner_fischer($S1, $S2);

sub wagner_fischer ($s, $t)
{
  my $m = length $s;
  my $n = length $t;

  my @s = ( "", split("", $s) );
  my @t = ( "", split("", $t) );

  my @d;

  for my $i (1 .. $m)
  {
    $d[$i][0] = $i;
    
    for my $j (1 .. $n)
    {
      $d[$i][$j] = 0;
    }
  }  

  for my $j (0 .. $n)
  {
    $d[0][$j] = $j;
  }

  for my $i (1 .. $m)
  {
    for my $j (1 .. $n)
    {
      my $cost = $s[$i] eq $t[$j]
        ? 0
	: 1;

      $d[$i][$j] = min( $d[$i-1][$j] +1,        # Deletion
                        $d[$i][$j-1] +1,        # Insertion
                        $d[$i-1][$j-1] +$cost); # Deletion
    }
  }

  return $d[$m][$n];
}
