#!/usr/bin/env perl
use v5.36;

while (<DATA>) {
    print if /^ \s* (?: \+ \d{2} | \( \d{2} \) | \d{4} ) \s+ \d{10} \s* $/x;
}

__END__
0044 1148820341
 +44 1148820341
  44-11-4882-0341
(44) 1148820341
  00 1148820341
