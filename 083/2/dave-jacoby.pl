#!/usr/bin/env perl
use v5.36;

use List::Util qw{ sum };

flip_array( 3,  10, 8 );
flip_array( 12, 2,  10 );
flip_array( 2,13,10,8 );

my $min;
my $hash;

sub flip_array( @array ) {
    $min  = 1_000_000;
    $hash = {};
    my @map = map { 0 } @array;
    _flip_array( 0, \@array, \@map );
    my ($low) = sort { mathit($a) <=> mathit($b) }
        grep { $min == $hash->{$_} } keys $hash->%*;
    my $minf  = mathit($low);
       @map   = split //, $low;
    my @munge = _munge( \@array, \@map );
    say '';
    say $min;
    say $minf;
    say join ', ', @munge;
}

sub _flip_array ( $index, $array, $map ) {
    if ( $array->[$index] ) {
        my $nmap->@* = $map->@*;
        for my $bit ( 0, 1 ) {
            $nmap->[$index] = $bit;
            my @munge = _munge( $array, $map );
            my $sum = sum @munge;
            _flip_array( $index + 1, $array, $nmap );
        }
    }
    else {
        my @munge = _munge( $array, $map );
        my $map1 = join '', $map->@*;
        my $sum = sum @munge;
        $hash->{$map1} = $sum;
        if ( $sum > 0 && $sum < $min ) { $min = $sum }
    }
}

sub _munge ( $array, $map ) {
    my @out;
    for my $i ( map { $_ - 1 } 1 .. scalar $array->@* ) {
        push @out, $map->[$i] ? -$array->[$i] : $array->[$i];
    }
    return @out;
}

sub mathit ($n) {
    return sum split //, $n;
}
