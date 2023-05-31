#!/usr/bin/env perl
use v5.36;

# Input
my $num = 1221;

# Palindrome Number
my $numStr = "$num";
my $res = 0;

$res = 1 if($numStr eq reverse $numStr);

# Output
say($res);
