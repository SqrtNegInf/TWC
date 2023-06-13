#!/usr/bin/env perl
use v5.36;

my $n = 100;
my $p = 0;

while ($p < 20) {
    $n =~ /^(\d)\d*(\d)$/;
    my $g_divisor = $1 . $2;

    if ($n % $g_divisor == 0){
        $p++;
        say $n . ' / ' . $g_divisor . ' = ' .
            ($n / $g_divisor);
    }

    $n++;
}
