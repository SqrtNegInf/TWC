#!/usr/bin/env perl
use v5.36;
use Memoize;
use bigint;
use Math::Prime::Util qw(is_prime);

memoize("padovan");
#die "Usage: ./ch-2.pl N\nto get the first N Padovan primes" unless @ARGV;
my %seen;
my $i=0;
my $N=10;
say "The first $N distinct Padovan primes are:";
for(1..$N){
    my $padovan=padovan($i++);
    redo if $seen{$padovan} || !is_prime($padovan); # Keep searching
    say("$padovan");
    $seen{$padovan}++; # save to avoid repetitions
}
sub padovan {
    my $n=shift;
    return 1 if $n<=2;
    padovan($n-2)+padovan($n-3);
}
