#!/usr/bin/env raku
# -*- Mode: Raku; indent-tabs-mode: nil; coding: utf-8 -*-
# vim: set et ts=4 sw=4:

#sub MAIN ( *@n where { @n.elems == 2 and @n.all ~~ Int and @n.all > 0 } ) {
my @n = 100, 500;
    with [gcd] @n {
        say( [1.. $_].grep(-> \k {$_ %% k}));
    }
#}
