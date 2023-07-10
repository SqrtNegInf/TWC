#!/usr/bin/env perl
use v5.36;

use List::Util qw(all);

my ($source, $target)= ("scriptinglanguage", "pearl");
my %available;
$available{$_}=1 for split "", $source; # initialize available character counts
my $output=(all {$available{$_}-- > 0} split "", $target)?"True":"False";
say "source: $source, target: $target -> $output";
