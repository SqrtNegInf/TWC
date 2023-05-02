#!/usr/bin/env perl
use v5.36;

no warnings; # Binary number > 0b11111111111111111111111111111111 non-portable at 192/1/adam-russell.pl line 19.

sub int2bits{
    my($n) = @_;
    my @bits;
    while($n){
        my $b = $n & 1;
        unshift @bits, $b;
        $n = $n >> 1;
    }
    return @bits
}

sub binary_flip{
    my($n) = @_;
    my @bits = int2bits($n);
    @bits = map {$_^ 1} @bits;
    return oct(q/0b/ . join(q//, @bits));
}

MAIN:{
    say binary_flip(5);
    say binary_flip(4);
    say binary_flip(6);
    { use bigint; say binary_flip(2**64 +1); }
}
