#!/usr/bin/env perl
use v5.36;
use Algorithm::Combinatorics qw(permutations);
use Text::Wrap qw(wrap $columns $break);

my @seen=<PELR PREL PERL PRLE PLER PLRE EPRL EPLR ERPL ERLP ELPR ELRP RPEL RPLE REPL RELP RLPE RLEP LPER LPRE LEPR LRPE LREP>;
my $first=$seen[0];
my @letters=split "", $first;
my %seen;
map {$seen{$_}=1} @seen;
my %permutations; # all permutations
$permutations{$_}=1 for map {join "", @$_} permutations(\@letters);
# Check the input
map {die "$_ is not a permutation of $first" unless $permutations{$_}} keys %seen;
$columns=62; $break=qr/\s/;
#say wrap("", "    ", "Input: ", join ", ", @seen);
say wrap("", "    ", "Missing permutations: ", join ", ",
                     grep {!$seen{$_}} keys %permutations);
