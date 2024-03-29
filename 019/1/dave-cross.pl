#!/usr/bin/env perl
use v5.36;

use Time::Piece;

# A month can only have five weekends if:
#
# * It has 31 days
# * The 1st of the month is a Friday

# Array of months with 31 days
my @months = (qw[Jan Mar May Jul Aug Oct Dec]);
my $format = '%Y-%b';

for my $y (1900 .. 2019) {
  for my $m (@months) {
    # Get the first day of the month as a Time::Piece object
    my $first = Time::Piece->strptime("$y-$m", $format);
    # Print the date if the 1st is a Friday
    say $first->strftime('%b %Y') if $first->day eq 'Fri';
  }
}
