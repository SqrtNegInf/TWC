#!/usr/bin/env perl
use v5.36;

my @A;

if (@ARGV) {@A = @ARGV;} else {@A = (7,8,3,12,10);}

sub leastneigh {
    my @array = @{$_[0]};
    my $youngest = $array[0];
    my @smallkids = ();
    push @smallkids, 0;
    for my $num (@array[1..$#array]) {
        if ($num < $youngest) {
            push @smallkids, 0;
            $youngest = $num;
        } 
        elsif ($num > $youngest) {
            push @smallkids, $youngest;
        } else { # $num == $youngest
            push @smallkids, 0;
        }
    }
    return [@smallkids];
}

print join " ", @{ leastneigh([@A]) };
print "\n";


=pod
is_deeply( leastneigh([7, 8, 3, 12, 10]), 
    [0, 7, 0, 3, 3], "example1 provided") ;
is_deeply( leastneigh([4, 6, 5]), 
    [0, 4, 4], "example2 provided") ;
is_deeply( leastneigh([ 10, 47, 16, 50, 29,  21, 18, 20, 6, 30,  11]), 
    [0, 10, 10, 10, 10,  10, 10, 10, 0, 6, 6 ], "eleven random numbers");
is_deeply( leastneigh([2, 3, 5, 7, 11, 13, 17]), 
    [0, 2, 2, 2, 2, 2, 2], "ascending sequences");
is_deeply( leastneigh([reverse (1..4)]),
    [0,0,0,0], "descending first 4 positive integers");
=cut
