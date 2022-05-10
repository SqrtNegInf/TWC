#!/usr/bin/env raku

multi sub MAIN(
    Int:D $input = 123
) {
    say $input.base(35);

}

=finish
multi sub MAIN(
    Str:D $ where 'decode',
    Str:D $input where $input ~~ m:i/^ '-'? <[0..9 A..Y]>+ $/
) {
    say $input.parse-base(35);
}
