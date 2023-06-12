#!/usr/bin/env perl
use v5.36;

sub nobleInt {
    my @ints = sort { $a <=> $b } @_;
    my %seen = ();
    for (my $i = 0; $i <= $#ints; ++$i) {
        my $count = 0;
      MOV:
        for (my $j = 0; $j <= $#ints; ++$j) {
            next MOV if $i == $j;
            ++$count if $ints[$i] < $ints[$j];
        }
        $seen{ $ints[$i] }++ if $count == $ints[$i];
    }
    return keys %seen;
}

my @L = (19,11,9,7,20,3,17,16,2,14,1);

my @nobleInteger = nobleInt @L;

if ( @nobleInteger ){
    print "Noble integer: $nobleInteger[0]\n";
} else {
    print "No noble integer.\n";
}
