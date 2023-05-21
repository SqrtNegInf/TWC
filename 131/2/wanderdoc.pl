#!/usr/bin/env perl
use v5.36;

use utf8; 

my @pair = find_delimiter(q Ъ""[]()Ъ, q Ъ"I like (parens) and the Apple ][+" they said.Ъ);
print join($/, @pair), $/;
@pair = find_delimiter(q Ъ**//<>Ъ , q Ъ/* This is a comment (in some languages) */ <could be a tag>Ъ);
print join($/, @pair), $/;


sub find_delimiter
{
     my ($del_pairs, $string) = @_;
     my @delimiter = split(//, $del_pairs);
     my (%opening, %closing);
     @opening { @delimiter[ grep $_ % 2 == 0, 0 .. $#delimiter ] } = undef;
     @closing { @delimiter[ grep $_ % 2 == 1, 0 .. $#delimiter ] } = undef;
     my @characters = split(//, $string);

     my @this_opening = grep exists $opening{$_}, @characters;
     my @this_closing = grep exists $closing{$_}, @characters;
     return join('', @this_opening), join('', @this_closing);
}
