#!/usr/bin/env perl

use v5.30;
use warnings;

# Note: this naive implementation has exponential time complexity (in terms of the list length)!
# For heuristic algorithms with lower average running time, see https://www.ijcai.org/Proceedings/09/Papers/096.pdf.
# However, note that even those have worst case exponential time complexity (in terms of the list length).
#
# Also note that multiple solutions might exist, but in that case only one possible solution is returned.
sub flip_count_minimum_non_negative {
    my @A = @_;

    my $min_sum;
    my $answer;

    for my $sign_bitmask ( 0 .. 2**( @A - 1 ) - 1 ) {
        my $num_signs = 0;
        my $sum       = 0;

        for my $a (@A) {
            if ( $sign_bitmask % 2 ) {

                # Negative sign.
                $sum -= $a;
                $num_signs++;
            }
            else {
                # Positive sign.
                $sum += $a;
            }

            $sign_bitmask /= 2;
        }

        # "Flip signs" if sum is negative.
        # This reduces the worst case running time by a factor of 2,
        # as we can assume the sign of the last element is fixed.
        if ( $sum < 0 ) {
            $num_signs = @A - $num_signs;
            $sum *= -1;
        }

        # Update minimum.
        if ( not defined($min_sum) or ( $sum < $min_sum ) ) {
            $min_sum = $sum;
            $answer  = $num_signs;
        }

        # Early stop criterion.
        last if $min_sum == 0;
    }

    return $answer;
}

say flip_count_minimum_non_negative( (2,13,10,8) );
