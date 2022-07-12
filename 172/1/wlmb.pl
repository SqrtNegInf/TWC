#!/usr/bin/env perl

use v5.36;

use Math::Prime::Util qw(primes);
my ($m,$n)=(38,2);
my @primes=@{primes($m)};
my @result= partitions($m,$n,\@primes);
say "$m=", join "+", @$_ foreach @result;
sub partitions($m, $n, $set){
    # return all partitions of $m into $n elements of the ordered $set
    return $m==0?([]):() if $n==0; # () means failure, ([]) means we are done
    my @set=grep {$_<=$m} @$set; # remove high unneeded elements
    my @results=();
    while(@set){
        my $element=pop @set; # try highest elements first
        my @r=partitions($m-$element, $n-1, \@set);
        push @results, map {push @$_, $element; $_} @r if @r;
    }
    return @results;
}
