#!/usr/bin/env raku

use lib ".";

use Number::Roman :to, :from;

unit sub MAIN (Str $first = 'IV', Str $operator = '+', Str $second = 'V');

my $f = from-roman($first);
my $s = from-roman($second);

given $operator
{
  when '+'  { say to-roman($f +  $s) };
  when '-'  { say to-roman($f -  $s) };
  when 'x'  { say to-roman($f *  $s) };
  when '*'  { say to-roman($f *  $s) };
  when 'xx' { say to-roman($f ** $s) };
  when '**' { say to-roman($f ** $s) };
  when '/'  { say to-roman($f / $s) };
  default   { die "unknown operator"; }
}
