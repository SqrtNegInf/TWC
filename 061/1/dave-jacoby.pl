#!/usr/bin/env perl
use v5.36;

use JSON;
my $json = JSON->new;

my @numbers = @ARGV;
@numbers = ( 2, 5, -1, 3 ) if scalar @ARGV < 4;

my @array = product_subarray(@numbers);
say $json->encode(@array);

sub product_subarray ( @numbers ) {
    my @output;
    for my $i ( 1 .. $#numbers ) {
        my $j       = $i - 1;
        my $product = $numbers[$j] * $numbers[$i];
        push @output, { p => $product, n => [ $numbers[$j], $numbers[$i] ], };
    }
    my ($output) = sort { $b->{p} <=> $a->{p} } @output;
    return $output->{n};
}
