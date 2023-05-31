#!/usr/bin/env perl
use v5.36;

use Test::More;

sub reverse_words
{
     my $str = $_[0];
     my @words = grep length($_), split(/\s+/, $str);
     return join(' ', reverse @words);

}

is(reverse_words('The Weekly Challenge'), 'Challenge Weekly The', 'Example 1');
is(reverse_words('    Perl and   Raku are  part of the same family  '),
     'family same the of part are Raku and Perl', 'Example 2');


done_testing();
