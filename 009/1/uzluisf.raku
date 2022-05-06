#!/usr/bin/env raku

sub find-first-square( UInt:D $with-different-n-digits where * > 0 ) {
    my @nums;
    for 1..∞ {
        my $square = $_ ** 2;
        if has-at-least($square, $with-different-n-digits) {
            @nums.push: $square;
            return @nums if @nums == 5;
        }
    }

    sub has-at-least( Int:D $number, Int:D $num-of-digits ) {
        my %digits = ($_ => True for $number.comb);
        %digits == $num-of-digits;
    }
}

sub MAIN() { put find-first-square(5) }

#(1..∞).map(* ** 2).grep(.comb.unique ≥ 5).head(5); # does not work
