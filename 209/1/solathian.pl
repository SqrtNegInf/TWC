#!/usr/bin/env perl
use v5.36;


# bits();               # error: array is empty
# bits(1);              # error: array is not ending with 0

bits(0, 0, 0);              # 1
bits(1, 0, 0);              # 1
bits(1, 1, 1, 0);           # 0
bits(0, 1, 1, 1, 0);        # 0
bits(0, 1, 0, 1, 1, 0);     # 1
bits(0, 1, 0, 1, 1, 0, 0);  # 1
bits(1, 0, 1, 1, 0, 0);     # 1
bits(1, 0, 0, 1, 1, 0);     # 1


sub bits(@array)
{

    die"Array is empty"                if(@array == 0);
    die"Array is not ending with 0"    if( $array[-1] != 0);


    while(@array > 1)
    {
        # shift once if the first character is 0, shift twice if it is a two bit character
        shift @array   if( $array[0] == 1 );
        shift @array;
    }
    
    say "0"     if(@array == 0);
    say "1"     if(@array == 1);
}
