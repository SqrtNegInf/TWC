#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

sub dec_to_bin { return sprintf("%b",$_[0]); }
sub is_palindrome { return $_[0] eq reverse($_[0]) ? 1 : 0 ; }

for my $num ( 1 .. 32) 
{
     print join("\t", $num, dec_to_bin($num), is_palindrome(dec_to_bin($num))), $/;
}
