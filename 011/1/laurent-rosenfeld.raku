#!/usr/bin/env raku

my %freeze = (F => 32, C => 0);
my %boil = (F => 212, C => 100);
my $speed_diff = (%boil<F> - %freeze<F> ) / (%boil<C> - %freeze<C> );

my $c = %freeze<C>;
my $f = %freeze<F>;

while abs($c - $f) > 0.2 {
    $f += ($c - $f)/2;
    $c +=  ( ($c - $f) / $speed_diff );
    # say "Approx: $c $f ", $c-$f;
}
say "Fahrenheit and Celsius scales meet at: ", $c.fmt("%.0f");
