#!/usr/bin/env perl
use v5.36;

use Number::Fraction qw/:constants/;

my $n = 7;

my %equivs;         # hash arrray to hold fraction and its decimal equivalent
my $LOWER_LIMIT = '0' . '/' . '1';    # lower limit in the output '0/1'
my $UPPER_LIMIT = '1' . '/' . '1';    # upper limit in the output '1/1'

for (1..($n-1)) {     # get numerators we will work with
  my $frac = Number::Fraction->new($_, $n);    # create fraction $_/$n
  $equivs{$frac} = ($_ / $n);                  # store decimal value in hash keyed by fraction
}

my $d = $n-1;
while($d) {                                    # create all other fractions with denoms 1 .. n-1
  for my $num (1..($d-1)) {
    my $frac = Number::Fraction->new($num, $d);
    $equivs{$frac} = ($num / $d);              # store decimal value in hash keyed by fraction
  }
  $d--;
}

# print hash sorted by decimal values, displayed by fraction value
print("Input: n = $n\n");
print("$LOWER_LIMIT ");
foreach my $v (sort { $equivs{$a} <=> $equivs{$b} } keys %equivs) {
   print("$v ");
}

print("$UPPER_LIMIT\n");
