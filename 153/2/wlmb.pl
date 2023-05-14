#!/usr/bin/env perl
use v5.36;
use Memoize;
use List::Util qw(sum0);
memoize qw(factorial);
#die "Usage: ./ch-2.pl N1 N2...\nto test if Ni is factorion" unless @ARGV;
foreach( (125, 145, 40585) ){
    say("Expected a non-negative integer: $_"), next unless $_>=0;
    my @digits=split '';
    my @factorials=map {factorial($_)} @digits;
    my $sum=sum0(@factorials);
    my $factorion=$sum==$_;
    say "$_ is", $factorion?"":" not", " factorion as ",
        join("! + ", @digits), "! = ", join(" + ",@factorials),
	" = $sum ", $factorion?"== ":"!= ", $_;
}
sub factorial {
    my $n=shift;
    return 1 if $n<=0;
    return $n*factorial($n-1);
}
