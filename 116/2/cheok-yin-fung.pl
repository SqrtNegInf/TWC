#!/usr/bin/env perl
use v5.36;

my $N = $ARGV[0] // 34;

print is_a_square_num(sum_of_sq($N));
print "\n";

sub sum_of_sq {
    my $num = $_[0];
    my $sum = 0;
    for (split "", $num) {
        $sum += $_*$_;
    }
    return $sum;
}

sub is_a_square_num {
    my $a = sqrt $_[0];
    return ($a !~ /\./ ? 1 : 0) ;
}
