#!/usr/bin/env perl
use v5.36;

use constant LIMIT => 10;

my $n = 0;
my @p;
my @strong;
my @weak;

do {{ # double block to allow next within do until
    next if (!is_prime(++$n));      # only primes allowed
    push @p, $n;
    next if (@p < 3);               # minimum 3 primes to begin

    my $last = $#p;
    my $r = ( $p[$last-2] + $p[$last] ) /2;

    next if($p[$last-1] == $r );    # balanced prime

    if ($p[$last-1] > $r ){
        next if @strong == LIMIT;
        push @strong, $p[$last-1];  # strong prime
    }else{
        next if @weak == LIMIT;
        push @weak, $p[$last-1];    # weak prime
    }

}} until (@strong == LIMIT && @weak == LIMIT);

print 'Strong primes: '.join(',', @strong)."\n";
print 'Weak primes: '.join(',', @weak)."\n";

sub is_prime {
    my $n = shift;
    return 1 == grep {$n % $_ == 0} (1 .. sqrt $n);
}
