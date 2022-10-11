#!/usr/bin/env raku

unit sub MAIN(
    Str $mac-address = 'abc1.20f1.345a'
);

# Converts in hh:hh:hh:hh:hh:hh form.
for $mac-address.comb(/\w/) {
    .print;
    given $++ {
        when 11 { succeed; }
        when $_ !%% 2 { print ":" }
    }
}
