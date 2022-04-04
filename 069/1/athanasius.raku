#!/usr/bin/env raku

my UInt constant $MAX    = 1e15.UInt;                      # Maximum upper bound
my      constant %MIDDLE = 0 => 1, 1 => 8, 8 => Nil;
my      constant %OUTER  = 1 => 6, 6 => 8, 8 => 9, 9 => Nil;
my      constant %INNER  = 0 => 1, %OUTER;
my      constant %PAIRS  = 0 => 0, 1 => 1, 6 => 9, 8 => 8, 9 => 6;

subset Bound of UInt where 1 <= * <= $MAX;      # +ve integer in specified range

#===============================================================================
sub MAIN
(
    Bound:D $A = 1,                           #= Lower bound (UInt: 1 <= A <= 10^15)
    Bound:D $B =200,        #= Upper bound (UInt: A <= B <= 10^15)
)
#===============================================================================
{
    #"Challenge 069, Task #1: Strobogrammatic Number (Raku)\n".put;

    "Input:  A = $A, B = $B\nOutput: ".print;

    if (my UInt $number = first-strobogrammatic-number($A)) <= $B
    {
        $number.print;
        $number = next-strobogrammatic-number($number);

        while $number <= $B
        {
            ", $number".print;
            $number = next-strobogrammatic-number($number);
        }
    }

    ''.put;
}

#-------------------------------------------------------------------------------
sub first-strobogrammatic-number(UInt:D $min --> UInt:D)
#-------------------------------------------------------------------------------
{
    my UInt $size  =  $min.chars;
    my UInt $first = ($size == 1) ?? 1 !! ('1' ~ '0' x ($size - 2) ~ '1').UInt;

            $first =  next-strobogrammatic-number($first) while $first < $min;

    return  $first;
}

#-------------------------------------------------------------------------------
sub next-strobogrammatic-number(UInt:D $number --> UInt:D)
#-------------------------------------------------------------------------------
{
    my UInt @digits =  $number.split('', :skip-empty).map: { .UInt };
    my UInt $size   =  @digits.elems;
    my UInt $middle = ($size / 2).floor;

    return %MIDDLE{ @digits[0] } // 11 if $size == 1;     # single digit number

    if $size % 2 == 1                                     # odd number of digits
    {
        if (my $next = %MIDDLE{ @digits[$middle] }).defined
        {
            @digits[$middle] = $next;

            return @digits.join('').UInt;
        }

        @digits[$middle] = 0;
    }

    for (1 .. --$middle).reverse -> UInt $i
    {
        my UInt $j = $size - $i - 1;

        if (my $next = %INNER{ @digits[$i] }).defined
        {
            @digits[$i] = $next;
            @digits[$j] = %PAIRS{ $next };

            return @digits.join('').UInt;
        }

        @digits[$i] = @digits[$j] = 0;
    }

    if (my $next = %OUTER{ @digits[0] }).defined
    {
        @digits[  0] = $next;
        @digits[*-1] = %PAIRS{ $next };

        return @digits.join('').UInt;
    }

    @digits[  0] = 0;
    @digits[*-1] = 1;
    @digits.unshift: 1;

    return @digits.join('').UInt;
}
