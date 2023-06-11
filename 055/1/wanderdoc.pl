#!/usr/bin/env perl
use v5.36;

my $string = shift // '100110011';
my $max_idx = find_max_pair($string);
print "[" . join("] [", @$max_idx) . "]", $/;



sub find_max_pair
{

     my $string = $_[0];
     my $len = length $string;
     my %pairs;


     for my $l ( 0 .. $len - 1 )
     {
          for my $r ( $l .. $len - 1 )
          {
               my $str2 = $string;
               substr($str2, $l, 1 - $l + $r) =~ tr/10/01/;
               my $cnt = $str2 =~ tr/1/1/;
               push @{ $pairs{ $cnt } }, "$l, $r";

          }
     }
     my ($max) = (sort { $b <=> $a } keys %pairs)[0];
     return $pairs{$max};

}
