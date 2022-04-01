#!/usr/bin/env raku

sub coins($s, @c) {
    (! @c.grep(* <= $s)) && return ((),);
    return (|coins($s-@c[0], @c).map({ @c[0], |$_ }), |coins($s, @c[1..*])).grep(*.sum == $s);
}

for coins(6, <6 1 2 4>.map(*.Int).sort) { .say};

# run as <script> <sum> <space-separated coin values>
