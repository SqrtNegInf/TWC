#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

my $cases = [
    ['Perl',   'Preel'],
    ['Weekly', 'Weeakly'],
    ['Box',    'Boxy'],
];

sub odd_character
{
    my ($s, $t) = @_;

    my %c;
    $c{$_}-- for split //, $s ;
    $c{$_}++ for split //, $t ;

    for (keys %c) {
        return $_ if $c{$_};
    }
    return '';
}

is(odd_character($cases->[0]->@*), 'e', 'Example 1');
is(odd_character($cases->[1]->@*), 'a', 'Example 2');
is(odd_character($cases->[2]->@*), 'y', 'Example 3');
done_testing();

exit 0;
