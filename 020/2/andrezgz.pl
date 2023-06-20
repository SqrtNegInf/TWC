#!/usr/bin/env perl
use v5.36;

my $n = 0;
until (amicable(++$n)) {};
print "Smallest pair of Amicable Numbers: ($n,".amicable($n).")\n";

{
    my %cache;
    sub amicable {
        my $n = shift;

        $cache{$n} = sum(factors($n)) unless exists $cache{$n};
        my $m = $cache{$n};
        return if $m == $n; # same number

        $cache{$m} = sum(factors($m)) unless exists $cache{$m};
        return if $cache{$m} != $n; # not amicable

        return $m;
    }
}

sub sum {
    my $s = 0;
    $s += $_ for @_;
    return $s;
}

sub factors {
    my $n = shift;
    my $upto = $n == 1 ? 1 : $n/2;
    return grep {$n % $_ == 0} (1 .. $upto);
}
