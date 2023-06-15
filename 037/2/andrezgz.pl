#!/usr/bin/env perl
use v5.36;

my $diff = daylight('december.csv') - daylight('november.csv');
print 'The daylight difference is ', int $diff/60, ':', abs($diff) % 60, $/;

# Modulo operator works funny with negative numbers, that's why I've used abs
# -1280 % 60 = 40 (not -20)
# With use integer you get proper and fast libc behavior.
# See https://stackoverflow.com/a/32090446 for more detail

sub daylight {
    my $fn = shift;
    my $daylight = 0;
    open my $fh, '<', $fn or die "Could not open file '$fn': $!";

    while (<$fh>) {
        chomp;
        my ($sunrise_h, $sunrise_m, $sunset_h, $sunset_m) = split /[:;]/;
        $daylight += ($sunset_h - $sunrise_h) * 60 + ($sunset_m - $sunrise_m);
    }

    close $fh;
    return $daylight;
}

__END__

./ch-2.pl
The daylight difference is -21:20 <--- almost a day!
