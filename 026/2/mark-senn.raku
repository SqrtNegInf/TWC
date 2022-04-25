#!/usr/bin/env raku

my @deg = (180,270,360);

    # Convert  from  degrees  to  radians.
    my @rad = @deg  <<*>> (pi /180);

    # Transform  from  degrees  to polar  coordinates.
    my  Complex  @z = @rad.map({e**(i *$_)});

    # Compute$p -bar in  polar  coordinates.
    my $p-bar = ([+] @z) / @z.elems;

    # Compute  arctangent  and  convert  from  radians  to  degrees.
    # Sample  inputs  and  outputs:
    #       INPUT          OUTPUT                           COMMENT
    #       ----------     -----------------------          -------
    #          1    1           1
    #          1    2           1.5
    #          1    2   3       2
    #         10  -10           0
    #         10   20   30      19.999999999999996          wrong
    #         60                59.99999999999999           wrong
    #         350   10          -1.614809932057922e-15      wrong
    my$theta-bar = atan2($p-bar.im ,$p-bar.re) * (180/pi);
    $theta-bar.say;
