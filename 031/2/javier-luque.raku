#!/usr/bin/env raku

srand 1;

sub MAIN (Str $variable = 'foo') {
    # Randomly populate the random value
    my $random_value = (0..^9).roll(12).join;
    GLOBAL::{'$' ~ $variable} = $random_value;

    # Say dynamic variable name and random value
    say 'Dynamic variable name: ' ~  $variable;
    say 'Random value: ' ~ GLOBAL::{'$' ~ $variable};

    # test like this: perl6 ch2.p6 test
    say 'Variable test is: ' ~ $*test if ($variable eq 'test');
}
