#!/usr/bin/env perl
use v5.36;
use Const::Fast qw(const);

const my $PI => 3.1415926535897932384626433832;
const my $RP => 2.5066282746310002416123552393;
const my $EP => 0.000000000001;
const my $X  => 0.99999999999980993;
const my @PV => (
  676.5203681218851,  -1259.1392167224028,    771.32342877765313,     -176.61502916214059,
   12.507343278686905,   -0.13857109526572012,  9.9843695780195716e-6,   1.5056327351493116e-7,
);

say sprintf( '%5.2f - %30.4f', $_/2, gamma($_/2) ) =~ s{[.]0000$}{}r  for -40..40;

## Two special cases - where "z" is a non-positive integer - the gamma function has "infinite" value
## When "z" < 0.5 we can write gamma(z) as a function of gamma(1-z)
## o/w we use the formula given in wikipedia - we do a minor tweak to the way the formula is laid out
## by removing the z--

sub gamma {
  my($i,$x,$z)=(0,$X,$_[0]);
  ($z<=0 && abs($z-int$z)<$EP) ? 'inf'
  : $z < 0.5                   ? $PI / sin($PI*$z) * gamma( 1-$z )
  : (map({$x+=$_/($z+$i++)}@PV),abs(($i=$RP*($i=$z+@PV-1.5)**($z-0.5)*$x/exp$i)-int$i)<$EP?int$i:$i)[-1]
}

