#!/usr/bin/env perl
use v5.36;

my ($start,$end) = (111,999);

my @range = ($start..$end);
my $step  = "0123456789";
my $num   = "@range ";
my %hash;
say "List of stepping number(s) from $start to $end";
while ($step =~ s/(.)(.)(.)/$2$3/) {
    my ($l,$m,$r) = ($1,$2,$3);
    $num =~ "$l$m$r "   && $hash{$&}++;
    $num =~ "$r$m$l "   && $hash{$&}++;
    $num =~ "$l$m$l "   && $hash{$&}++;
    $num =~ "$m$l$m "   && $hash{$&}++;
    $num =~ "$r$m$r "   && $hash{$&}++;
    $num =~ "$m$r$m "   && $hash{$&}++;
};

say for sort {$a-$b} keys %hash;
