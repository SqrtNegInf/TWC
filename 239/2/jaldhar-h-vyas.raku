#!/usr/bin/env raku

sub MAIN(
    $allowed,
    *@str
) {
    my $class = "<[$allowed]>";
    @str.grep({ /^ <$class>+ $/ }).elems.say;
}