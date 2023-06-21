#!/usr/bin/env perl
use v5.36;

my $total_guests = shift // 100;

# we assume that each guest get his or her part of the pie
# according with the following formula:

# guest_part = remaining x guest_ordinal / total_guests

# as you can see, is exactly as the Pie Puzzle states, when total_guests
# is 100

my $remaining    = 100;    # this is 100% of the pie
my $biggest_part = 0;
my $biggest_part_guest;

for my $guest_ordinal ( 1 .. $total_guests ) {
    my $part = $remaining * $guest_ordinal / $total_guests;
    $remaining -= $part;    # because $part is what $guest_orinal gets
    next unless $part > $biggest_part;

    # here we have a bigger part than any other before
    $biggest_part       = $part;
    $biggest_part_guest = $guest_ordinal;
}

printf
"On a Pitagoras Pie Party of %u, %u-th guest gets the biggest part of the pie (%.4f%%)\n",
  $total_guests, $biggest_part_guest, $biggest_part;
