#!/usr/bin/env perl

use v5.36;
use List::Util qw(sum);
use Math::Prime::Util qw(euler_phi);
say "$_: ", next_perfect_totient() for(1..20);
sub next_perfect_totient{
    state $current=1;
    ++$current;
    ++$current until $current==sum recursive_totients($current);
    $current
}
sub recursive_totients($m){ #(totient(m), totient(totient($m))...)
    my $t=euler_phi($m);
    $m==2?($t):(recursive_totients($t), $t)
}
