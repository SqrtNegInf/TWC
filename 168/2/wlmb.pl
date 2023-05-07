#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw(is_prime factor);
for( 2 .. 12 ){
    say("The argument ($_) should have been >=2"), next unless $_>=2;
    my $N=$_;
    $N=join "", factor($N) while(!is_prime($N));
    say "HP$_=$N"
}
