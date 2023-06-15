#!/usr/bin/env perl
use v5.36;

my $n = 2230120;

die 'invalid 7-digits date'.$/
    if $n !~ /^
                (?<y1>[12])                     # 1st: 1 or 2
                (?<y2>\d{2})                    # 2nd & 3rd: anything
                (?<m>0[1-9]|1[0-2])             # 4th & 5th: month
                (?<d>0[1-9]|[12][0-9]|3[01])    # 6th & 7th: day of the month
             $/x;

my $year = ( $+{y1} == 1 ? 20 : 19) . $+{y2};
my ( $month, $day) = ( $+{m}, $+{d} );

die "invalid day of month".$/ unless is_valid_dom($year, $month, $day);

print join '-', ($year, $month, $day);
exit 0;

sub is_valid_dom {
    my ($y, $m, $d) = @_;
    return if $d > 30  && grep {$m == $_} (4,6,9,11); # 30-day months
    return if $d > 29  && $m == 2;                    # 28-day February
    return if $d == 29 && $m == 2                     # 29-day February
              && ! ($y % 4 == 0 && ($y % 100 != 0 || $y % 400 == 0) ); # not a leap year
    return 1; # valid day for the month and year
}
