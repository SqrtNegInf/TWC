#!/usr/bin/env perl
use v5.36;

my @r;
my $n   = 11111;
my $m   = $n;

#Backticks solution using factor, works both on windows and linux :D
#say "Using backticks and factor system command:";
#say `factor $n`=~s/.+: //r;

#Using ntheory module
#say "Using module nthoery";
#use ntheory 'factor';
#@r = factor $m;
#say "@r\n";

#But I feel like I should do a non-backtick/module solution so here we go:
#It's slow(and inaccurate) on very large numbers
say "Using non-backticks solution (trial division/modulo):";
use bigint;
@r = ();
while ($n % 2<1) {
    push @r, 2;
    $n /= 2;
}
my $f = 3;
while ($f*$f<=$n) {
    while ($n % $f<1) {
        push @r, $f;
        $n /= $f;
    }
    $f+=2;
}
$n>1 && push @r, $n;
say "@r\n";
