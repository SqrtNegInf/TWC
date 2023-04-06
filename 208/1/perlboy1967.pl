#!/usr/bin/env perl

use v5.36;

use common::sense;

use List::Util qw(min);
use List::MoreUtils qw(frequency);

use Test::More;
use Test::Deep qw(cmp_deeply);

sub mimimumIndexSum(\@\@) {
  my %f = frequency(@{$_[0]},@{$_[1]});

  my %i;
  for (@_) {
    my $i = 0;
    for (@$_) {
      $i{$_} += $i++ if ($f{$_} > 1);
    }
  } 

  my $min = min(values %i);

  return [sort grep { $i{$_} == $min } keys %i];
}

cmp_deeply(mimimumIndexSum(@{[qw(Perl Raku Love)]},@{[qw(Raku Perl Hate)]}),[qw(Perl Raku)]);
cmp_deeply(mimimumIndexSum(@{[qw(A B C)]},@{[qw(D E F)]}),[]);
cmp_deeply(mimimumIndexSum(@{[qw(A B C)]},@{[qw(C A B)]}),['A']);
cmp_deeply(mimimumIndexSum(@{[qw(Z B C D)]},@{[qw(D C A B)]}),[qw(B C D)]);

done_testing;
