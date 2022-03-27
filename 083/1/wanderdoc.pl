#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use List::Util qw(reduce);
use Test::More;

sub words_length
{
     my $string = $_[0];
     my @words = split(/\s+/, $string);

     shift @words;

     pop @words;

     my $length = reduce {$a + $b} map length, @words;
     return $length;
}

is(words_length("The Weekly Challenge"), 6, 'Example 1');
is(words_length("The purpose of our lives is to be happy"), 23, 'Example 1');
is(words_length("Markmið lífs okkar er að vera hamingjusöm"), 19, 'Example X');
done_testing();
