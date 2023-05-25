#!/usr/bin/env perl
use v5.36;

my $input = $ARGV[0]//  '03:10';
my $output;
my $angle; 
my @hand;

my @time = split(':',$input);

$hand[0]=30*$time[0]+($time[1]/60*30); # Calculate hour hand position. 
$hand[1]=$time[1]/60*360; # Calculate minute hand move
$angle = abs($hand[0] - $hand[1]); # Difference between angles

# We want the smallest of the angles. It must be less than or equal to 180.
if ($angle <= 180) {
  $output = $angle;
}
else {
  $output = abs(360-$angle);
}

print "Input: \$T = $input\n";
print "Output: $output\n";
