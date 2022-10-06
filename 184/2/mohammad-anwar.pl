#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;

is split_array('a 1 2 b 0', '3 c 4 d'),
   [ [[1,2,0], [3,4]], [['a','b'], ['c','d']] ],
   'Example 1';

is split_array('1 2', 'p q r', 's 3', '4 5 t'),
   [ [[1,2], [3], [4,5]], [['p','q','r'], ['s'], ['t']] ],
   'Example 2';

done_testing;

#
#
# METHOD

sub split_array(@list) {
    my @int = ();
    my @str = ();

    foreach my $entry (@list) {
        my @_int = ();
        my @_str = ();
        foreach my $char (split /\s/,$entry) {
            push @_int, $char if ($char =~ /^\d$/);
            push @_str, $char if ($char =~ /^[a-z]$/);
        }
        push @int, \@_int if @_int;
        push @str, \@_str if @_str;
    }

    return [ \@int, \@str ];
}
