#!/usr/bin/env perl
use v5.36;
no warnings;

use Test::More;

my @TESTS = (
  [ [  11,  1 ] , 100 ],
  [ [ 101,  1 ] , 110 ],
  [ [ 100, 11 ] , 111 ],
);

my Tie $x, 'DecBin';
my Tie $y, 'DecBin';
my Tie $z, 'DecBin';

foreach(@TESTS) {
  $x = $_->[0][0];
  $y = $_->[0][1];
  $z = $_->[1];
  say join "\t", $x, $y, $x+$y, $z, $x+$y==$z ? 'OK' : 'FAIL';
}
exit;
foreach(@TESTS) {
  my $x = DecBinExp->new($_->[0][0]);
  my $y = DecBinExp->new($_->[0][1]);
  my $z = DecBinExp->new($_->[1]);
  say join "\t", $x, $y, $x+$y, $z, $x+$y==$z ? 'OK' : 'FAIL';
}

package DecBin;

use overload ('+'=>'bin_add','=='=>'comp','""'=>'show');

sub new  { bless \$_[1], $_[0] }
sub show { ${$_[0]} }
sub comp { ${$_[0]} == ${$_[1]} }

sub bin_add {
  my($t,$c,$m,$a,$b) = (0,0,1,${$_[0]},${$_[1]});
  $c+=$a%10+$b%10,$t+=$m*($c&1),$m*=10,$c>>=1,$a=int$a/10,$b=int$b/10 while$a||$b||$c;
  DecBin->new($t);
}

package DecBinExp;

use overload ('+'=>'bin_add','=='=>'comp','""'=>'show');

sub new  { bless \$_[1], $_[0] }
sub show { ${$_[0]} }
sub comp { ${$_[0]} == ${$_[1]} }

sub bin_add {
  my($t,$c,$m,$a,$b) = (0,0,1,${$_[0]},${$_[1]});
  while ($a||$b||$c) {
    $c +=  $a%10 + $b%10;
    $t +=  $m * ($c&1);
    $m *=  10;
    $c >>= 1;
    $a =   int $a/10;
    $b =   int $b/10;
  }
  DecBin->new($t);
}

