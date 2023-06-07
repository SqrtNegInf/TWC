#!/usr/bin/env perl
use v5.36;

my $string = '';
my $counter = 0;

while ( $counter < 30 )
{
     my $new_part = switch(scalar reverse($string));
     $string .= '0';
     $string .= $new_part;
     printf("S%02d: %10d$/", ++$counter, length($string));
}
# print $string, $/; # length($string) = 1_073_741_823.
sub switch
{
     my $str = $_[0]; $str =~ tr/01/10/; return $str;
}
