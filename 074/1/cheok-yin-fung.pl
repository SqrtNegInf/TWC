#!/usr/bin/env perl
use v5.36;

use Test::More tests => 3;


sub verify {
    my @array = @{$_[0]};
    my $m = $_[1];
    my $c = 0;
    for (@array) {
        $c++ if $m==$_;
    }
    return ($c > (scalar @array)/2.0 ? 1 : undef);
}

sub bm_majority_vote_alg {
    my @array = @{$_[0]};
    my $i = 0;
    my $m;
    for (@array) {
        if ($i == 0) {
            $m = $_;
            $i++
        }
        else {
            $m == $_ ? $i++ : $i--;
        }
    }
    

    return ( verify(\@array, $m) ? $m : -1 );
}


print bm_majority_vote_alg(\@ARGV);

is_deeply(  bm_majority_vote_alg( [1, 2, 2, 3, 2, 4, 2] ) , "2", "example1 provided");
is_deeply(  bm_majority_vote_alg( [1, 3, 1, 2, 4, 5] ) , "-1", "example2 provided");
is_deeply(  bm_majority_vote_alg( [2, 2, 2, 3, 1, 3, 4] ) , "-1", "array: 2223134");
