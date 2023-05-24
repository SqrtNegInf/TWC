#!/usr/bin/env perl
use v5.36;

my $counter=0; # item counter
my $total=0; # running total
while(<DATA>){
    chomp;
    ++$counter;
    $total += $_;
    my $average=$total/$counter;
    say "Input: $_ Output: $average";
}

__END__
10
20
30
40
50
60
70
80
90
100
