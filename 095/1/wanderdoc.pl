#!/usr/bin/env perl
use v5.36;

use Regexp::Common;
use Test::More;

sub is_palindrom_number
{
     my $num = $_[0];
     die "Not a number!$/" unless $num =~ $RE{num}{real};

     my $rev = reverse $num;

     return ($num eq $rev ) ? 1 : 0;
}

is(is_palindrom_number(1221), 1, 'Example 1');
is(is_palindrom_number(-101), 0, 'Example 2');
is(is_palindrom_number(90),   0, 'Example 3');

done_testing();
