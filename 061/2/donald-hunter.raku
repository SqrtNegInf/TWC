#!/usr/bin/env raku
multi find-ips(Str $input where / \d ** 4..12 /) {
    gather {
        take .list.flat.join('.')
        for $input ~~ m:exhaustive
            / ^ ( <[1..9]> ** 0..2 \d <?{ $/ !~~ Nil and $/.Int < 256 }> ) ** 4 $ /
    }
}

multi find-ips(Str $input) {
    die "{$input} is not a valid input, it should be 4 to 12 digits.";
}

sub MAIN(Str $input = '25525511135' ) {
    CATCH { default { .say } }

    my @ips = find-ips($input);
    say "Found {+@ips} potential IP address{+@ips == 1 ?? '' !! 'es'} in {$input}:";
    say @ips.join("\n").indent(4);
}
