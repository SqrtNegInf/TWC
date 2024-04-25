#!/usr/bin/env raku

use Test;

my @Test =
    # in        choices                         exp
    'JB 007',   ['jj', 'bb', 'bjb'],            'bjb',
    'Da2 abc',  ['abcm', 'baacd', 'abaadc'],    'baacd',
    'aBc 11c',  ['accbbb', 'abc', 'abbc'],      'accbbb',
    'abb cDE',  ['abcDE', 'abcde', 'abcdde'],   '',
    'abb cDE',  ['abcDE', 'abcde', 'ABcbde'],   'ABcbde',
    'abb cDE',  ['abBCDEE', 'abcde', 'abcdbe'], 'abcdbe',
    'abb cDE',  ['abcde', 'abcdbe','abBCDEE' ], 'abcdbe',
    'ab',       ['abcde', 'ABc','abB' ],        'ABc',
;
plan @Test ÷ 3;

sub func( $str is copy, @str -->Str) {
    $str ~~ s:g/<:!L>// ;                   # scrub to ":Letter"s only
    $str = Bag.new( $str.fc.comb);          # foldcased
    for @str.sort( *.chars) {
        return $_ if $str ⊆ Bag.new( $_.fc.comb);
    }
    return '';
}

for @Test -> $str, @str, $exp {
    is func($str, @str), $exp,
            sprintf "%-8s <- %-8s <- %-20s", $exp, $str, @str.join: ' ';
}

done-testing;

my $str = 'abb cDE';
my @str =  'abcDE', 'abcde', 'ABcbde';
say "\nInput: \$str = $str\n       @str = @str[]\nOutput: ", func( $str, @str);
