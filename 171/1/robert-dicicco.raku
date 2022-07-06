#!/usr/bin/env raku

sub divisors ($number, :$not-self, :$not-one)
{
  my @divisors;
  for ($not-one ?? 2 !! 1) .. $number/2 -> $candidate
  {
    @divisors.push: $candidate if $number %% $candidate;
  }

  @divisors.push: $number unless $not-self;

  return @divisors;
}

my $n = 1;
my $count = 0;
my $sum = 0;

while ( $count < 20 ) {
  $sum = [+] divisors($n, :not-one, :not-self);

  if ($n % 2 == 0 ) {    # skip if is an even number
    $n++;
    next;
  }

  if (($sum > $n)) {     # if the sum of divisors is greater than the source number,
    print "$n ";         # and it is odd, print it

    $count++;
  }

  $n++;
}
