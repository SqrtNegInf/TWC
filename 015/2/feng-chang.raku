#!/usr/bin/env raku

sub offset (Str $c where *.chars == 1 && 'A' le * le 'Z') returns UInt:D {
    $c.ord - 'A'.ord;
}

sub char (Int $offset where 0 ≤ * ≤ 25) returns Str:D {
    chr($offset + 'A'.ord);
}

multi MAIN(Str $plain = 'ATTACKATDAWN', :$key = 'LEMON') {
    for $plain.uc.comb Z ($key.uc.comb xx ∞).flat -> [$p, $k] {
        print char((offset($p) + offset($k)) mod 26);
    }
    put '';
    decrypt('LXFOPVEFRNHR');
}

sub decrypt(Str $cipher, :$key = 'LEMON') {
    for $cipher.uc.comb Z ($key.uc.comb xx ∞).flat -> [$c, $k] {
        print char((offset($c) - offset($k)) mod 26);
    }
    put '';
}
