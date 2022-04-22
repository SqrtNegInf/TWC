#!/usr/bin/env raku

sub MAIN( Str $var = 'foo' ) {
    my $newvar = $var;
    $($newvar) = 42;

    say "$var = ", $($newvar);
}
