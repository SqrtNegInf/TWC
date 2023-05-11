#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0 product any);

#die "Usage: ./ch-1.pl N1 N2 N3 ... to get the means of the numbers Ni..." unless @ARGV;
my @ARGV = (1,3,5,6,9);
#say "In: ", join ", ", @ARGV;
my $AM= sprintf "%.2f", sum0(@ARGV)/@ARGV;            # arithmetic mean
my $product=product(@ARGV);
my $GM=($product<0 && @ARGV%2==0)? "Undefined":sprintf "%.2f", $product**(1/@ARGV);
my $HM=(any{$_==0} (@ARGV))?"Undefined":sprintf "%.2f", @ARGV/sum0(map {1/$_} (@ARGV));
say sprintf "AM=$AM GM=$GM HM=$HM";
