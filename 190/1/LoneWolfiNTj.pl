#!/usr/bin/env perl

use v5.36;

sub appropriate ($string)
{
   $string =~ m/(^[A-Z][a-z]*$)|(^[a-z]+$)|(^[A-Z]+$)/ and return 1
   or  return 0;
}

my @array = qw( Perl TPF PyThon raku );
if (scalar(@ARGV)>0) {@array = @ARGV}

for (@array)
{
   my $a = appropriate($_);
   $a and say "$a - capitalization of $_ is correct."
      or  say "$a - capitalization of $_ is incorrect.";
}
