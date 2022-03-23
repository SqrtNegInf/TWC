#!/usr/bin/env raku

my ($a, $b) = map {$_.Int}, <238 13>;
my $result = $a % 2 ?? $b !! 0;
while $a > 1 {
    $a div= 2;
    $b *= 2;
    $result += $b if $a % 2;
}
say $result;
