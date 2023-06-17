#!/usr/bin/env perl
use v5.36;

sub is_division_by_zero {
    my ($num,$den) = @_;
    return if ( eval { $num = $num/$den; 1 } );
    return 1;
}

print 'Division by zero' if is_division_by_zero(1,0);
