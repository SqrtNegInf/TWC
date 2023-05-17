#!/usr/bin/env perl
use v5.36;

sub dot_product{
    my($s, $t) = @_;
    return $s->[0] * $t->[0] if(@{$s} == 1 && @{$t} == 1);
    my $u = pop @{$s};
    my $v = pop @{$t};
    return $u * $v + dot_product($s, $t);
}

MAIN:{
    my(@a, @b);
    @a = (1, 2, 3);
    @b = (4, 5, 6);
    print dot_product(\@a, \@b) . "\n";
}
