#!/usr/bin/env perl
use v5.36;

use Math::Trig qw/rad2deg deg2rad/;

my @angles = map {deg2rad $_} (181,182);

my ($sin_sum,$cos_sum) = (0,0);
foreach my $angle (@angles) {
    $sin_sum += sin $angle;
    $cos_sum += cos $angle;
}

if (abs $cos_sum < 1e-10 ) {
    print 'Mean angle: ? (Cosine sum is zero)';
    exit 0;
}

#Scaling does not matter for atan2, no need to calculate sin and cos means
my $angles_mean = rad2deg atan2 $sin_sum, $cos_sum;

if    ($cos_sum < 0 ) {$angles_mean +=180}
elsif ($sin_sum < 0 ) {$angles_mean +=360}

$angles_mean -= 360 if $angles_mean > 180; #analogous angle
print 'Mean angle: '.$angles_mean;
