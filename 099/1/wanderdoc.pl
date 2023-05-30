#!/usr/bin/env perl
use v5.36;

use Test::More;

sub pattern_match
{
     my ($string, $pattern) = @_;

     my $re = my_glob2regex_string($pattern); # or better use Text::Globe

     $re = qr/\A$re\z/;
     return $string =~ $re ? 1 : 0;
}

sub my_glob2regex_string
{
     my $pattern = $_[0];
     $pattern =~ s/\*/.*/g; 
     $pattern =~ s/\?/./g;
     return $pattern;
}



is(pattern_match(qw(abcde a*e)),   1, 'Example 1');
is(pattern_match(qw(abcde a*d)),   0, 'Example 2');
is(pattern_match(qw(abcde ?b*d)),  0, 'Example 3');

is(pattern_match(qw(abcde a*c?e)), 1, 'Example 4');
is(pattern_match(qw(abcde *e*)),   1, 'Example 5');
done_testing();
