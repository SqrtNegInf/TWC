#!/usr/bin/env perl
use v5.36;

use IO::File; 

sub readN
{
     my ($file, $num) = @_;
     state $handle = (IO::File->new("./$file", "r") or die "$!");
     my $into;
     read($handle, $into, $num);
     return $into;
}
print readN("input.txt", 4), $/; # 1234
print readN("input.txt", 4), $/; # 5678
print readN("input.txt", 4), $/; # 90
