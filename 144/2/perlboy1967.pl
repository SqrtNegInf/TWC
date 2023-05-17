#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(combinations);
use List::Util qw(sum);
use List::MoreUtils qw(firstidx);

my ($U,$V,$N) = (2,5,10);
($U,$V,$N) = @ARGV if (scalar(@ARGV) == 3);

printf 'Input: $u = %d, $v = %d, $n = %d'."\n", $U,$V,$N;
printf "Output: %s\n", join(',',getUlamSequence($U,$V,$N));

sub getUlamSequence {
  my ($u,$v,$n) = @_;

  my @s = ($u,$v);
  while (scalar(@s) < $n) {
    my %v;
    my $c = combinations(\@s, 2);
    while (my $ar = $c->next) {
      my $sum = sum @$ar;
      $v{$sum}++ if ($sum > $s[-1]);
    }
    my @v = sort{$a<=>$b} keys %v;
    push(@s,$v[firstidx{$v{$_} == 1} @v]) ;
  }

  return @s;
}

