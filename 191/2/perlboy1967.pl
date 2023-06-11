#!/usr/bin/env perl
use v5.36;

use Time::HiRes qw(gettimeofday tv_interval);
use Algorithm::Permute;
use List::MoreUtils qw(firstidx);

sub isCuteEntry {
  state $c;

  my $idx = $_[0].'|'.$_[1];

  return $c->{$idx} if defined $c->{$idx};

  $c->{$idx} = (($_[0] % $_[1]) != 0 and ($_[1] % $_[0]) != 0) ? 1 : 0;

  return $c->{$idx};
}


sub nCuteLists {
  my ($n,$m) = (0,0);

  my $p = Algorithm::Permute->new([1 .. $_[0]]);
  while (my @l = $p->next) {
    $m++;
    my $i = 1;
    $n++ if ((firstidx { isCuteEntry($l[$i-1],$i++) } @l) == -1);
  }

  return "$n / $m";
}


# Note, testing up to 12 because of time lengthy

for (1..9) {
  my $t0 = [gettimeofday];
  printf "nCuteLists($_) = %s\n", nCuteLists($_);
  #printf "nCuteLists($_) = %s (in %f seconds)\n", nCuteLists($_), tv_interval ($t0);
}
