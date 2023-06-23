#!/usr/bin/env perl
use v5.36;

use Math::BigFloat;  
my $accuracy = 128;
my $x = Math::BigFloat->new(163);
$x -> bsqrt();
$x -> bmul(Math::BigFloat->bpi());  
$x -> bexp($accuracy); 
print "$x\n";  
