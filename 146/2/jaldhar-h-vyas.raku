#!/usr/bin/env raku

sub parent(Str $fraction) {
    my ($numerator, $denominator) = $fraction.split(q{/}).map({ .Int(); });
    unless ($numerator ~~ Int) && ($denominator ~~ Int) {
        return q{};
    }

    if $numerator < $denominator {
        return "$numerator/{($denominator - $numerator).abs}";
    } elsif $numerator > $denominator {
        return "{($denominator - $numerator).abs}/$denominator";
    } else {
        return q{};
    }
}

sub MAIN(Str $member = '3/5') {

    say "parent = '{parent($member)}' and grandparent = '{parent(parent($member))}'";
}
