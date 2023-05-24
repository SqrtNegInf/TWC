#!/usr/bin/env perl
use v5.36;

use List::Util qw(first);

my %memo = map { $_ => 1 } (1,2,3,5);

sub smth5p($n) {
    $memo{$n} && return 1;
    my $den = first {$n % $_ ==0} (2,3,5);
    return ($den ? ($memo{int($n/$den)} && ($memo{$n}=1)) : 0)
}

my ($count,$nr)=(0,0);
while ($count < 10) {
    $nr+=1;
    (smth5p($nr)) && do {
	say $nr;
	$count+=1;
    };    
}
