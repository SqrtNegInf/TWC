#!/usr/bin/env perl
use v5.36;

use List::Util qq{sum0};

my @list = ( 12, 3 );
@list = @ARGV ? @ARGV : @list;

for my $n (@list) {
    my $h = hisb($n);
    say <<"END";
    Input:  $n
    Output: $h
END
}

sub hisb ( $n ) {
    my $m = $n;
    my $b = sum0 split m{}, sprintf '%b', $m;
    while (1) {
        $m++;
        my $d = sum0 split m{}, sprintf '%b', $m;
        return $m if $b == $d;
    }
}
