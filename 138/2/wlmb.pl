#!/usr/bin/env perl
use v5.36;

use integer;
use List::Util qw(sum0);
use POSIX qw(floor);

foreach( (81, 9801, 36) ){
    my $sqrt=floor sqrt($_);
    say("$_ is not a perfect square"),next unless $sqrt**2==$_;
    my @good_splits=grep {sum0(@$_)==$sqrt} splits($_);
    say "Input: $_ Output: ",
        @good_splits
        ?"1 as ".join("=", (map {join "+", @$_} @good_splits), $sqrt)
        :0;
}
sub splits { # array of all possible ways to split a string
    my $string=shift;
    my $counter=0;
    my @splits=();
    while(defined (my $split=one_split($string, $counter++))){
        push @splits, $split;
    }
    return @splits;
}
sub one_split { # produce the n-th way to split a string
    my ($string, $counter)=@_;
    my $length=length $string;
    return if $counter>=2**($length-1);
    my @split=();
    my @binary_counter=split "", sprintf "%0${length}b", $counter;
    my @chars=split "", $string;
    my @current=();
    for(0..$#chars){
        unshift @current, pop @chars;
        if(pop @binary_counter){
            unshift @split, join '', @current;
            @current=();
        }
    }
    unshift @split, join '', @current if @current;
    return [@split];
}
