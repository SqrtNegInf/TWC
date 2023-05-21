#!/usr/bin/env perl
use v5.36;

my $subtract = 1;
my ($answer, $number);
my @set = qw (10 27 85 101);

# Loop through input numbers
foreach(@set) {
  $number = $_;
  $subtract=0;
  $answer=0;

# Used repeat subtraction method to get calcuate integer square root
# When number is less than or equal than value of subraction, it has been found
  until ($number <= $subtract) {
    $number = $number - $subtract;
    $subtract+=2;
    $answer++; # Square root value
  }
  print "Integer square root of $_ is $answer.\n\n";
}
