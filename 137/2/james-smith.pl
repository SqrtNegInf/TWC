#!/usr/bin/env perl

use strict;

use warnings;
use feature qw(say);
use Test::More;
#use Benchmark qw(cmpthese timethis);
use Data::Dumper qw(Dumper);

my $MAX         = 1e9;
my $S_MAX       = 1e7;
my $MULT        = 100;
my $COUNT = 500;
my @TESTS = (
  [ 56, 0 ],
  [ 57, 0 ],
  [ 59, 0 ],
  [196, 1 ],
);

my %seeds;
my %lychrel;

is( lychrel(      $_->[0]), $_->[1] ) for @TESTS;
is( lychrel_large($_->[0]), $_->[1] ) for @TESTS;

done_testing();

sub lychrel {
  my($n,$c) = (shift,$COUNT);
  ($n eq reverse $n) ? (return 0) : ($n+= reverse $n) while $c-- && $n <= $MAX;
  1;
}

sub lychrel_large {
  my ( $c, @n ) = ( $COUNT, split //, $_[0] );
  while( $c-- ) {
    return 0 if (join '', my @r = reverse @n ) eq (join '', @n); ## Check if palindromic
    ## Add the arrays as if numbers - note this is compact - but does the job!
    ( $n[$_] += $r[$_] ) > 9  && ($n[$_] -= 10, $_ ? ($n[$_-1]++) : (unshift @n, 1) ) for reverse 0 .. @n-1;
  }
  1;
}

sub lychrel_large_seed {
  my ( $c, $n, @n ) = ( $COUNT, $_[0], split //, $_[0] );
  while( $c-- ) {
    my @r = reverse @n;
    my $rn = join '', @r;
    my $nn = join '', @n;
    return exists $lychrel{$seeds{$rn}} if $r[0] && defined $seeds{$rn};
    return exists $lychrel{$seeds{$nn}} if          defined $seeds{$nn};
    $seeds{ $rn } = $n if $rn < $S_MAX*$MULT && $r[0];
    $seeds{ $nn } = $n if $nn < $S_MAX*$MULT;
    return 0 if $rn eq $nn; ## Check if palindromic
    ## Add the arrays as if numbers - note this is compact - but does the job!
    ( $n[$_] += $r[$_] ) > 9  && ($n[$_] -= 10, $_ ? ($n[$_-1]++) : (unshift @n, 1) ) for reverse 0 .. @n-1;
  }
  1;
}

