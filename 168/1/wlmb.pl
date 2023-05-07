#!/usr/bin/env perl
use v5.36;

use bigint;
use Math::Prime::Util qw(is_prime);

my $N=13;
my @last_perrins=(3,0,2);
my @perrin_primes;
my %seen;
while(@perrin_primes<$N){
    push @last_perrins, my $perrin=$last_perrins[-3]+$last_perrins[-2];
    shift @last_perrins; # no need to keep old Perrins
    $seen{$perrin}=1, push @perrin_primes, $perrin if is_prime($perrin) and !$seen{$perrin};
}
say join " ", sort {$a<=>$b} @perrin_primes;
