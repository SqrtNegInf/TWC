#!/usr/bin/env raku

use Test;

multi bit-ct-to-bi-numbers( Int $n, Bool :$strict --> List) {
   my $o = $strict ?? 2**($n-1) !! 0;
   return ( for $o..^2**$n { sprintf "%0$n" ~ 's', $_.base(2) })
}

#multi MAIN ( Int $n where * > 0) {
#    say "Input: \$n = $n";
#    say 'Output: ', bit-ct-to-bi-numbers( $n).join(', ');
#}

#multi MAIN ( 'test') {
    my @Test =
         1 => qw<0 1>,
         2 => qw<00 01 10 11 >,
         3 => qw<000 001 010 011 100 101 110 111 >,
         4 => (sprintf( "%04s", $_) for (0..^16)».base(2)),
         5 => (sprintf( "%05s", $_) for (0..^32)».base(2)),
         6 => (sprintf( "%06s", $_) for (0..^64)».base(2)),
        12 => (sprintf( "%012s", $_) for (0..^4096)».base(2)),
    ;

    plan 2 × @Test;

    for @Test -> $t {
        is-deeply bit-ct-to-bi-numbers($t.key), $t.value, "testing $t.key()";
        is-deeply bit-ct-to-bi-numbers($t.key, :strict),
                    $t.value[1+$t.value.end/2 .. $t.value],
                    "testing $t.key() strictly";
    }
    done-testing;
#    exit;
#}
