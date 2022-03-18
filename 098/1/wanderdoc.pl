#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);


use FindBin qw($Bin); # Windows.
use IO::File; 
use feature 'state';



sub readN
{
     my ($file, $num) = @_;
     state $handle = (IO::File->new("$Bin/$file", "r") or die "$!");
     my $into;
     read($handle, $into, $num);
     return $into;
}
print readN("input.txt", 4), $/; # 1234
print readN("input.txt", 4), $/; # 5678
print readN("input.txt", 4), $/; # 90
