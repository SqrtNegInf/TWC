#!/usr/bin/env raku

#my $p = 10 ** -19;         # temp, for 'numeric underflow' error
my $p = 10 ** -100;         # Precision p

my $n = 1;                  # Dummy     n
my $l = 0;                  # Last sum  l
my $s = 1.FatRat;           # Sum       s
my $f = 1.FatRat;           # Factorial f


while abs($l-$s) > $p {

    $l=$s;

    $f*=$n++;
    $s+=(1/$f);
}

say "Eulers's number: $s";
