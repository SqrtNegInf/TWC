#!/usr/bin/env perl
use v5.36;

use Modern::Perl;
no warnings 'experimental';

use Math::Prime::Util qw/forprimes/;
use POSIX;

if (defined($ARGV[0])) {
    say bn($ARGV[0]);
}
else {
    say bn(20);
}



sub bn {
    my $req = $_[0];
    my $show_all_values = $req <= 50; 
    # show all values if the required number is small

    my %prime = (1 => [2, 3, 5, 7],
                 2 => [11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 
                       47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97],
                 3 => [],
                 4 => [],
                );

    my $digit_len;

    given ($req) {
        $digit_len = 1 when $_ <= 10;
        $digit_len = 2 when $_ <= 241;
        $digit_len = 3 when $_ <= 10537;
        $digit_len = 4 when $_ <= 573928;
        default {die "You're asking too many!\n";}
    }

    eval { forprimes {push $prime{3}->@*, $_}  100, 999; } if $digit_len >= 3; 
    eval { forprimes {push $prime{4}->@*, $_} 1000,9999; } if $digit_len >= 4;

    my $ind = $req;
    $ind = $req-10 if $digit_len == 2;
    $ind = $req-241 if $digit_len == 3;
    $ind = $req-10537 if $digit_len == 4;
    my $c = 3;
    $c = ceil( ( sqrt(8*$ind+1) - 1 ) / 2 ) - 1;

    my @temp;

    for my $i (0..$c) {
        my $I = $prime{$digit_len}[$i];
        my $_j = scalar $prime{$digit_len}->@* - 1;
        for my $J ($prime{$digit_len}->@[$i..$_j]) {
            my $product = $I*$J;
            push @temp, $product;
        }
    }
    @temp = sort {$a<=>$b} @temp;
    if ($show_all_values) {
        my @brilliant = (-1, 4, 6, 9, 10, 14, 15, 21, 25, 35, 49);
        push @brilliant, @temp;
        say join "\n", @brilliant[1..$req];
        return;
    }
    return $temp[$ind-1];
}



use Test::More tests=> 14;
ok bn(60) == 841;
ok bn(80) == 1079;
ok bn(100) == 1369;
ok bn(120) == 1763;
ok bn(140) == 2231;
ok bn(160) == 2809;
ok bn(241) == 9409;
ok bn(5000) == 197503;
ok bn(10000) == 696191;
ok bn(10416) == 851927;
ok bn(10537) == 994009;
ok bn(10538) == 1009*1009;
ok bn(573927) == 9967*9973;
ok bn(573928) == 9973*9973;

# ref: OEIS:A078972

