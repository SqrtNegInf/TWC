#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;
use List::Util qw/sum/;

my $cases = [
    ['Raku'],
    ['Perl'],
    ['Julia'],
    ['Uiua'],
];

sub reverse_wovels
{
    my $str = shift;

    my $qr = qr/[aeiou]/i;
    my @str = split('', $str);
    $str[0] = lc($str[0]);
    my @w = reverse grep { lc(/$qr/) } @str;
    for (@str) {
        $_ = shift @w if /$qr/;
    }
    $str[0] = uc($str[0]);
    return join('', @str);
}

is(reverse_wovels($cases->[0]->@*), 'Ruka',  'Example 1');
is(reverse_wovels($cases->[1]->@*), 'Perl',  'Example 2');
is(reverse_wovels($cases->[2]->@*), 'Jaliu', 'Example 3');
is(reverse_wovels($cases->[3]->@*), 'Auiu',  'Example 4');
done_testing();

exit 0;

         
