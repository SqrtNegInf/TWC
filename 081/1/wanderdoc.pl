#!/usr/bin/env perl
use v5.36;

sub common_base
{
     my ($long, $short) = @_;
     if ( length($long) < length($short) )
     {
          ($long, $short) = ($short, $long);
     }
     my @output;
     my $len_short = length($short);

     my $len_long = length($long);
     for my $i ( reverse 1 .. $len_short )
     {
          my $fraction = $len_long / ($len_short - $i + 1);
          next unless $fraction == int($fraction);
          my $candidate = substr($short, $i - 1);
          if ( $long eq $candidate x  $fraction )
          {
               push @output, $candidate;
          }
     }
     return @output;


}
print "> ", join(' ', common_base('abcdabcd', 'abcdabcdabcdabcd')), $/;
print "> ", join(' ', common_base('aa', 'aaa')), $/;
print "> ", join(' ', common_base('abcdabcdabcdabcdabcdabcd', 'abcdabcdabcd')), $/;
