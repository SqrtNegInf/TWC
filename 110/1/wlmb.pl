#!/usr/bin/env perl
use v5.36;

my $pattern= join '|', map {qr(^\s*$_\s*$)} qw(\+\d{2}\s\d{10} \\(\d{2}\\)\s\d{10} \d{4}\s\d{10});
print "Output:\n", grep {$_=~$pattern} <DATA>;

__END__
0044 1148820341
 +44 1148820341
  44-11-4882-0341
(44) 1148820341
  00 1148820341
