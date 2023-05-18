#!/usr/bin/env perl
use v5.36;
no warnings;

my ($a, $b, $c, $final);
my @test = qw (11 1 101 1 100 11);

for ($c=0; $c<$#test+1; $c+=2) {
  $a = $test[$c];
  $b = $test[$c+1];

  $final = binary_add($a, $b);
  print "Input: \$a = $a; \$b = $b\n";
  print "Output: $final\n\n";
}

sub binary_add {
  my $x = shift;
  my $y = shift;

# Determine which number is larger
  my $diff = length($x) - length($y);
  my ($sum, $num, $i);
  my (@arr1, @arr2, @num);
  my $carry=0;

# Append left with 0s to help with piecewise math.
  if ($diff > 0) {
    $diff = length($x);
    $y = sprintf("%0${diff}d", $y);

  }
  elsif ($diff < 0) {
    $diff = length($y);
    $x = sprintf("%0${diff}d", $x);
  }

# Split numbers into pieces
  @arr1=split(//,$x);
  @arr2=split(//,$y);
  for ($i=$#arr1; $i>-1;$i--) {
    $sum=$arr1[$i]+$arr2[$i]+$carry;

# If/elses to ensure no values greater than 1.
    if ($sum eq 2) {
      $sum = 0;
      $carry = 1; 
    }
    elsif ($sum eq 3) {
      $sum = 1;
      $carry = 1;
    }
    else {
      $carry = 0;
    }
    $num=$sum.$num
  }

# One last check for a carry.
  $num="1".$num if $carry eq 1;
  return "$num";
}
