#!/usr/bin/env perl
use v5.36;
use bigint;
use Text::Wrap qw(wrap $columns $break);

#memoize qw(left_factorial factorial);
#die "Usage: ./ch-1.pl N\nto get the first N left factorials" unless @ARGV;
my $N=10;
$columns=62; $break=qr/\s/;
say wrap("", "    ", "The first $N left factorials are: ",
    join ", ", map {left_factorial($_)} (0..$N-1));
sub left_factorial{
    my $n=shift;
    return factorial(0) if $n<=0;
    return factorial($n)+left_factorial($n-1);
}
sub factorial{
    my $k=shift;
    return 1 if $k<=0;
    return $k*factorial($k-1);
}
