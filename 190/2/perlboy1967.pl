#!/usr/bin/env perl

use v5.16;
use warnings;

use Test::More;
use Test::Deep qw(cmp_deeply);

use List::MoreUtils qw(all firstidx);
use Algorithm::Permute;

sub decodedList ($) {
  state $d = {map { (ord($_) - ord('A') + 1, $_) } 'A' .. 'Z'};

  my %res;
  my $len = length($_[0]);

  # Create substring length list of lists
  my @l = ([(2) x ($len >> 1), (1) x ($len % 2)]);
  while (1) {
    my @a = @{$l[-1]};
    my $i = firstidx {$_ == 2} @a;
    last if $i == -1;

    splice(@a,$i,1,1,1); 
    push(@l,[@a]);
  }

  # Find and decode the digits
  for (@l) {
    Algorithm::Permute::permute {
      my @p = unpack(join(' ',map { "a$_" } @$_),$_[0]);
      if (all { defined $d->{$_} } @p) {
        $res{join('',map { $d->{$_} } @p)}++;
      }
    } @$_;
  }

  return [sort keys %res];
}

cmp_deeply(decodedList('11'),[qw(AA K)]);
cmp_deeply(decodedList('1115'),[qw(AAAE AAO AKE KAE KO)]);
cmp_deeply(decodedList('127'),[qw(ABG LG)]);

done_testing;
