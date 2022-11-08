#!/usr/bin/env raku

use Test;

is 'e', greater-character <e m u g>, 'b';
is 'c', greater-character <d c e f>, 'a';
is 'r', greater-character <j a r>,   'o';
is 'c', greater-character <d c a f>, 'a';
is 'v', greater-character <t g a l>, 'v';

done-testing;

subset OneLetter of Str where / ^ <[a..z]> $/;
subset Letters of List where .all ~~ OneLetter;

sub greater-character(Letters $_, OneLetter \l --> OneLetter) {
    .grep(* gt l).sort.head // l
}

