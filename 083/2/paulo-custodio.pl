#!/usr/bin/env perl
use v5.36;

my @A = (2,13,10,8);
say count_flips(@A);


sub count_flips {
    my(@a) = @_;

    # setup initial conditions
    my @sign = (1) x scalar(@a);
    my $min_flips = 0;
    my $min_sum = sumprod(\@a, \@sign);

    while (next_flip(\@sign)) {
        my $sum = sumprod(\@a, \@sign);
        if ($sum >= 0) {
            my $flips = scalar(grep {$_==-1} @sign);
            if ($sum < $min_sum) {
                ($min_sum, $min_flips) = ($sum, $flips);
            }
            elsif ($sum == $min_sum && $flips < $min_flips) {
                ($min_sum, $min_flips) = ($sum, $flips);
            }
        }
    }
    return $min_flips;
}

# odometer-style sign flipper
sub next_flip {
    my($sign) = @_;
    for my $i (0 .. $#{$sign}) {
        if ($sign->[$i] == 1) {
            $sign->[$i] = -1;
            return 1;
        }
        else {
            $sign->[$i] = 1;
        }
    }
    return 0;
}

sub sumprod {
    my($a, $sign) = @_;
    my $sum = 0;
    for my $i (0 .. $#{$a}) {
        $sum += $a->[$i]*$sign->[$i];
    }
    return $sum;
}
