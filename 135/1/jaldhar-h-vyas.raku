#!/usr/bin/env raku

#sub MAIN(
#    Int $N
for 1, 1234, 1234567 -> $N {
    my $n = $N.subst(/^\-/, q{});

    if $n !~~ /^ \d+ $/ {
        say "$n Not an integer.\n";
        next;
    }

    my $len = $n.chars;

    if $len % 2 == 0 {
        say "Even number of digits\n";
        next;
    }

    if $len < 3 {
        say "Too short.\n";
        next;
    }

    say $n.substr(($len - 3) / 2, 3);
}
