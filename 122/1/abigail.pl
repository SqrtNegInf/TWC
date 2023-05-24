#!/usr/bin/env perl
use v5.36;

$;=0; # silence warning under 5.36

while (<DATA>) {
say $_=($;+=$_)/$.
}

__END__
10
20
30
40
50
60
70
80
90
