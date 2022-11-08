#!/usr/bin/env raku

sub MAIN(
    $target = 'a', #= target character
    @array  = qw/d c a f/
) {
    my $result = $target;
    for @array.sort -> $char {
        if ($char gt $target) {
            $result = $char;
            last;
        }
    }

    say $result;
}
