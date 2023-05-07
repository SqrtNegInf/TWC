#!/usr/bin/env perl
use v5.36;
use Test::More;
use Math::Prime::Util qw(nth_prime forprimes);
use bignum;

my @x = (1); forprimes { push @x, $x[-1] * $_ } nth_prime($ARGV[0]//10)-1;

say sprintf '%'.int(2+4/3*log($x[-1])/log 10).'s', th($_) for @x;

sub th { scalar reverse( (reverse $_[0]) =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/gr ) }


#----|----#----|----#----|----#----|----#----|----#----|----
say$a=1;forprimes{say$a*=$_}nth_prime($ARGV[0]//10)-1;
say$a=1;forprimes{say$a*=$_}nth_prime 9;
say$a=1;forprimes{say$a*=$_}23
