#!/usr/bin/env perl
use v5.36;

# Turn on method signatures
use feature 'signatures';
no warnings 'experimental::signatures';

MAIN: {
    if ( check_for_div_by_zero( (42,0) ) ) {
        say "Denominator is zero";
    } else {
        say "Denominator is not zero";
    }
}

sub check_for_div_by_zero ( $top, $bottom ) {
    local $@;
    my $result =
      eval { use warnings FATAL => 'all'; $top / $bottom };    # Make things like "1 / abc" fatal.

    if ( defined($result) ) {
        return;
    } elsif ( $@ =~ /^Illegal division by zero / ) {
        return 1;
    } else {
        die($@);
    }
}

