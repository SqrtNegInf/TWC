#!/usr/bin/env perl
use v5.36;

# Valid phone number templates, where n is a digit.
# Internal whitespace is squashed, leading/trailing is trimmed.
my %valid = 
    map { y/ / /sr => 1 } 
    split /\s*(\n|$)\s*/, q{
        +nn  nnnnnnnnnn
        (nn) nnnnnnnnnn
        nnnn nnnnnnnnnn
    };

print for grep { check_number($_) } <DATA>;

# Check if a number matches any template in %valid
sub check_number {
    local $_ = shift;

    s/^\s+//, s/\s+$//; # Trim leading and trailing whitespace
    y/0-9/n/, y/ / /s;  # Replace digits, squash internal spaces

    return $_ if $valid{$_};
}

__END__
0044 1148820341
 +44 1148820341
  44-11-4882-0341
(44) 1148820341
  00 1148820341
