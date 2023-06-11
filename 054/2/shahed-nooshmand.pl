#!/usr/bin/env perl
use v5.36;

my %hail = (1 => 1);

for (1..1e4-1) {
    my $n = $_;
    my $i = 0;
    until (exists $hail{$n}) {
    	$n = $n % 2 ? $n * 3 + 1 : $n / 2;
    	$i++
    }
    $hail{$_} = $i + $hail{$n}
}

print "$_    $hail{$_}\n" for (sort { $hail{$b} <=> $hail{$a} } keys %hail)[0..4]
