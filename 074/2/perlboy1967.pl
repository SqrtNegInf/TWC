#!/usr/bin/env perl
use v5.36;

use Tie::IxHash;

my @test = qw(ababc xyzzyx abcabdeabefaf);

my ($S) = @ARGV;
#$S //= $test[rand(scalar @test)];
$S //= $test[1];

my $O;
tie my %cf, 'Tie::IxHash';

foreach my $c (split(//, $S)) {
  $cf{$c}++;
  my @c = grep { $_ if $cf{$_} == 1 } keys %cf;
  $O .=  (scalar @c ? $c[-1] : '#');
}

printf "Input: \$S = '%s'\n", $S;
printf "Output:     '%s'\n", $O;
