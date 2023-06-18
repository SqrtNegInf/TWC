#!/usr/local/bin/perl
use v5.36;

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
