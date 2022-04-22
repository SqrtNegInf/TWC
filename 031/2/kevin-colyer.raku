#!/usr/bin/env raku

use Test;

sub MAIN($name='foo'){
    # From http://rosettacode.org/wiki/Dynamic_variable_names#Perl_6
    # Don't think this works on Rakudo > 2018.03
    my $var=$name;
    say "variable named $var is {$::('var')}";
    $::('var')=137;
    say "variable named $var is {$::('var')}";

}

