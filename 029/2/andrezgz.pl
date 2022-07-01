#!/usr/local/bin/perl

# https://perlweeklychallenge.org/blog/perl-weekly-challenge-029/
# Task #2
# Write a script to demonstrate calling a C function.
# It could be any user defined or standard C function.

use strict;
use warnings;

no lib '/usr/local/lib/perl5/site_perl/5.32.1';
no lib '/usr/local/lib/perl5/site_perl/5.32.0';

use Inline C => <<'EOT';
float square ( float x )
{
    return ( x * x );
}
EOT

my $input = 2;
print square $input;

__END__

./ch-2.pl 12
144
