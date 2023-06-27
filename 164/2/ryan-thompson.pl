#!/usr/bin/env perl

use v5.36;

use List::Util qw< sum >;

#sub is_happy(_); # passing $_ by default, big whoop

my $count = pop // 8;

# Output the first $count Happy Numbers
for (local $_ = 1; $count > 0 ; $_++) {
    next unless is_happy($_);
    say;
    $count--;
}

# Return true if $_ is a happy number
sub is_happy($n) {

    my %seen;
    for (my $c = $n; $c != 1; $c = sum map { $_*$_ } split //, $c) {
        return if $seen{$c}++;
    }

    return 1
}
