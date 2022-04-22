#!/usr/bin/env raku

sub MAIN (Str $name = 'foo', Str $value = 'boo') {
    my %hash = $name => $value;
    say "The item is called $name and its value is %hash{$name}";
}
