#!/usr/bin/env perl
use v5.36;
use POSIX;

sub farey{
    my($order) = @_;
    my @farey;
    my($s, $t, $u, $v, $x, $y) = (0, 1, 1, $order, 0, 0);
    push @farey, "$s/$t", "$u/$v";
    while($y != 1 && $order > 1){
        $x = POSIX::floor(($t + $order) / $v) * $u - $s;
        $y = POSIX::floor(($t + $order) / $v) * $v - $t;
        push @farey, "$x/$y";
        ($s, $t, $u, $v) = ($u, $v, $x, $y);
    }
    return @farey;
}

MAIN:{
    print join(", ", farey(7)) . "\n";
}
