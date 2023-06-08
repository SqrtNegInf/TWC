#!/usr/bin/env perl
use v5.36;

for my $string ( qw (xyxx xy xxyyyyy xxxyyyyy xyxyxx xxxxxxxy xyyyyyyy) )
{
     my $num = rotate($string);
     print $num, $/, $/;
}

sub rotate
{
     my $str = $_[0];

     my $orig = $str;
     my $len = length($str);
     my $n = 0;
     do
     {
          $n++;
          $str = substr($str, $n % $len) . substr($str, 0, $n % $len); 
          print "DEBUG: ${n}: ${str}$/";
     } 
     while ($str ne $orig);
     return $n;
}
