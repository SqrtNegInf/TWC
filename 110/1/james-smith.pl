#!/usr/bin/env perl

use strict;

use warnings;
use feature qw(say);
use Test::More;

print grep { is_valid_phone_number($_) } <DATA>;

sub is_valid_phone_number {
  return m{\A           # Start of line
           \s*          # Some white-space ?
           (?:          # Prefix - one of:
             [+]\d+ |   #   +{digits}
             00\d+  |   #   00{digits}
             [(]\d+[)]  #   ({digits})
           )
           \s+          # Some white-space
           \d+          # String of numbers
           \s*          # Some white-space ?
           \Z           # End of line
          }x;
}

sub is_valid_phone_number_compact {
  return m{\A\s*(?:[+]\d+|00\d+|[(]\d+[)])\s+\d+\s*\Z};
}

__END__
0044 1148820341
 +44 1148820341
  44-11-4882-0341
(44) 1148820341
  00 1148820341
