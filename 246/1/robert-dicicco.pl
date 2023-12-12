#!/usr/bin/env perl
use v5.36;

srand 1;

my %seen = ();
my @sorted = ();
my @unsorted = ();

my $cnt = 0;
while(1) {
    my $num = int(rand(100));
    next if exists($seen{$num});
    $seen{$num} = 1;
    if ($num > 0 and $num <= 49) {
        push(@unsorted,$num);
        $cnt++;
        last if $cnt == 6;
    }
}
@sorted = sort { $a <=> $b } @unsorted;
say "@sorted";
