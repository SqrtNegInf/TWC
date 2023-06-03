#!/usr/bin/env perl
use v5.36;

#variables
my $N = 4;
my $bin;
my @array;
my $count = 0;


convertBinary();
sub convertBinary {

    foreach(my $i = 1; $i <= $N; $i++) {
        $bin = sprintf ("%b", $i);
        @array = ();
        @array = split //, $bin;
        countBit();
    }
    
    print "output: $count\n";
}

sub countBit {
    
    foreach(my $j = 0; $j < @array; $j++) {
        if ($array[$j] == 1) {
            $count++;
        }
    }
}




