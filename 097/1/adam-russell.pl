#!/usr/bin/env perl
use v5.36;

sub caesar_cypher{
    my($s, $n) = @_;
    my @cypher = map { unless(ord($_) == ord(' ')){
                           my $x = ((ord($_) - $n) < ord('A')?(ord($_) - $n + 26):(ord($_) - $n)); 
                           chr($x);
                       }
                       else{
                           $_
                       }
                 } split(//, $s);
    return join("", @cypher);
}

MAIN:{
    my($S, $N);
    $S = "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG";
    $N = 3;
    print "$S\n";
    print caesar_cypher($S, $N) . "\n";
}
