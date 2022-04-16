#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

for my $number ( 0 .. 50 )
{
     print join(' = ', join(' ', 'Decimal', $number),
                       join(' ', 'Octal', sprintf("%o", $number))), $/;  
}
