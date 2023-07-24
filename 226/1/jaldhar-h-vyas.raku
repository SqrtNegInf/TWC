#!/usr/bin/env raku

#sub MAIN( $string, *@indices) {
my $string = 'lacelengh';
my @indices = [3,2,0,5,4,8,6,7,1];

    my @letters = $string.comb;
    my @result;

    for @letters Z @indices -> ($letter, $index) {
        @result[$index] = $letter;
    }

    @result.join.say;
#}
