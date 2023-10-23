#!/usr/bin/env raku

sub MAIN(
    $allowed = 'ab',
    @str = <ad bd aaab baa badab>
) {
    my $class = "<[$allowed]>";
    @str.grep({ /^ <$class>+ $/ }).elems.say;
}
