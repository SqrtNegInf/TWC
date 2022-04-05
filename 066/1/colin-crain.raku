#!/usr/bin/env raku



sub MAIN (Int $numerator = 11, Int $denominator where { $denominator != 0 } = 3) {

    my $quotient_floor = divide_to_floor( $numerator, $denominator );
    "floor $numerator ÷ $denominator = $quotient_floor".say;

}

sub absolute (Int $num, Bool $negate is rw) {
##  Int -> (Int absolute value of $num, Int is negative)
    return $num if $num >= 0;
    $negate = ! $negate;
    0 - $num;
}



sub divide_to_floor (Int $numerator, Int $denominator is copy) {
## integer division floor function
    my $remainder;
    my $quotient_floor = 0;
    my $negate         = False;
    $remainder    = absolute($numerator, $negate);
    $denominator  = absolute($denominator, $negate);

    ## do integer division on two positive values
    while ($remainder - $denominator >= 0) {
        $remainder -= $denominator;
        $quotient_floor++;
    }

    ## convert to floor for negative results
    if $negate {
        ## the negative of the floor of x i the ceiling of -x
        ## - ⎣x⎦ = ⎡-x⎤
        ## so subtract 1 unless ⎣x⎦ = ⎡x⎤, which is when {x} = 0
        ## or in other words when the remainder is 0
        $quotient_floor = 0 - $quotient_floor;
        $quotient_floor-- if $remainder != 0;
    }

    return $quotient_floor;
}
