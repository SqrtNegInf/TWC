#!/usr/bin/env perl
use v5.36;

my @N = (1, 2, 1, 2);
my $i = 0;
my $position = 0;

while ($i < @N && $i != @N - 1 and $N[$i] != 0){
    $position = $N[$i];
    $i = $position + $i;
}
if ($i == @N - 1) {
    print "Output: 1\n";
}
else {
    print "Output: 0\n";
}





