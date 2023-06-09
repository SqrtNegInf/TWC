#!/usr/bin/env perl
use v5.36;

# Define octet regexp options
my %d = (
  1 => '\d',
  2 => '[1-9]\d',
  3 => '1\d\d|2[0-4][0-9]|25[0-5]',
);

my %re;

# Build regexp hash arrays
for my $a (1..3) {
  for my $b (1..3) {
    my $ab = $a + $b;
    for my $c (1..3) {
      my $abc = $ab + $c;
      for my $d (1..3) {
        my $abcd = $abc + $d;
        push(@{$re{$abcd}},"($d{$a})($d{$b})($d{$c})($d{$d})");
      }
    }
  }
} 

while(<DATA>) {
  if (my ($ipnum) = $_ =~ m#(\d{4,12})#) {

    my $len = length($ipnum);

    print "$ipnum:\n";
    study($ipnum);
    foreach my $re (@{$re{$len}}) {
      if ($ipnum =~ m#^$re$#) {
        print "\t".join('.', $1, $2, $3, $4)."\n";
      }
    }
  }
}

__DATA__
1234
12345
123456
1234567
12345678
1234567190
1211121191
12315611110
127200201110
227201201110

