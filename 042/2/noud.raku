#!/usr/bin/env raku

srand 1;

sub rand_brackets($size) {
    return [~] (<( )>.pick() for ^$size);
}

sub balanced($brackets) {
    # Count the open ( and close ) brackets sequentially. ( is given +1, ) is
    # given -1. If the count ever goes below zero there are more close
    # brackets than open brackets, hence an unbalanced string. If at the end
    # the count is more than zero there are more open brackets than close
    # brackets, hence an unbalanced string.
    my $c = 0;

    for $brackets.comb() -> $b {
        if ($b === '(') {
            $c++;
        } elsif (--$c < 0) {
            return False;
        }
    }

    return $c == 0;
}

say "()    - " ~ balanced("()");
say "(())  - " ~ balanced("(())");
say ")(    - " ~ balanced(")(");
say "())() - " ~ balanced("())()");


my $brackets = '';
for 1..20 -> $i {
    # Only generate bracket strings of length 4, because with higher lengths
    # the randomly generated strings rarely are balanced.
    $brackets = rand_brackets(4);
    if (balanced($brackets)) {
        say $brackets ~ ' is balanced.';
    } else {
        say $brackets ~ ' is not balanced.';
    }
}
