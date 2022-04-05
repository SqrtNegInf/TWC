#!/usr/bin/env perl

use warnings;
use strict;
use utf8;
use feature ":5.26";
use feature qw(signatures);
no warnings 'experimental::signatures';


sub nth_series_cubic ( $dif ) {
    my @c;
    my $x;
    for my $y ( 1..100 ) {  
        $x = $y + $dif;
        push @c, ($x**3 - $y**3) / ($x - $y) ;
    }
    return @c;
}

sub is_prime ($num) {
    for ( 2..sqrt $num ) {
        return 0 unless $num % $_;
    }
    return 1;
}

## output section
my $out;
for my $diff ( 1..10 ) {
    $out .= sprintf "  %3s  | %s\n", 
        $diff, 
        join ' ', grep { is_prime($_) && $_ <= 1000 } nth_series_cubic( $diff ) ;
}

say<<~"END";
    series | sequence
    -------+------------------------------------------
    $out
    END

