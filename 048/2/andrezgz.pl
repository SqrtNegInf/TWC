#!/usr/bin/env perl
use v5.36;

my $y = 1999;

my @months = qw/Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec/;

while ( ++$y < 3000 ) {
    # year is inverted and divided to get month and day
    my ($m, $d) = scalar(reverse $y) =~ m/../g ;
    next unless is_valid_dom($y, $m, $d);
    print $months[$m-1] . ' ' . $d . ', ' . $y .$/;
}

sub is_valid_dom {
    my ($y, $m, $d) = @_;
    return if $d < 1 || $d > 31 || $m < 1 || $m > 12; # impossible days/months
    return if $d > 30  && grep {$m == $_} (4,6,9,11); # 30-day months
    return if $d > 29  && $m == 2;                    # 28-day February
    return if $d == 29 && $m == 2                     # 29-day February
              && ! ($y % 4 == 0 && ($y % 100 != 0 || $y % 400 == 0) ); # not a leap year
    return 1; # valid day for the month and year
}
