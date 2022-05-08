#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dump q/pp/;
my @a = split(/\,/, '1,2,3,4,9,10,14,15,16');
my $a = pp @a;
$a =~ s/\.{2}/-/g;
$a =~ tr/( )//d;
print "$a\n";  
