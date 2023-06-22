#!/usr/bin/env perl
use v5.36;

# we just write the required functions as Perl subs:

sub F {
    my $n = shift;
    return $n ? $n - M( F( $n - 1 ) ) : 1;
}

sub M {
    my $n = shift;
    return $n ? $n = $n - F( M( $n - 1 ) ) : 0;
}

# now we can use those functions to show how those sequences start:

print "F: ";
print F($_), ', ' for 0 .. 19;
print "...\n";
print "M: ";
print M($_), ', ' for 0 .. 19;
print "...\n";
