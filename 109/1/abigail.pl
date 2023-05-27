#!/usr/bin/env perl
use v5.36;

my $COUNT = 20;

my $TYPE_PLAIN   =  0;
my $TYPE_FETCH   =  1;
my $TYPE_COMPUTE =  2;

my $type = $TYPE_PLAIN;   # Default
   $type = $TYPE_FETCH;  #if @ARGV && $ARGV [0] eq "fetch";
   $type = $TYPE_COMPUTE;#if @ARGV && $ARGV [0] eq "compute";



if ($type == $TYPE_PLAIN) {
    say "0, 0, 0, 2, 0, 5, 0, 6, 3, 7, 0, 15, 0, 9, 8, 14, 0, 20, 0, 21";
#}
#elsif ($type == $TYPE_FETCH) {
#    use OEIS;
#    $, = ", ";
#    say oeis (48050 => $COUNT);  # We want the first numbers from
                                 # sequence A048050.
}
elsif ($type == $TYPE_COMPUTE) {
    use List::Util qw [sum0];
    $, = ", ";
    #
    # Sum the divisors; a divisor has mod 0. This is very inefficient
    # even for smallish integers, but since we're asked to only 
    # calculate the first 20 numbers, we don't have to care about
    # efficiency.
    #
    say map {my $n = $_; sum0 grep {!($n % $_)} 2 .. $_ / 2} 1 .. $COUNT;
}
