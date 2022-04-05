#!/usr/bin/env raku

subset DigitStr of Str where * ~~ / ^ <[ 0 .. 9 * # ]>+ $ /;

constant %LETTERS =
{
    1  => [ < _ , @   > ],
    2  => [ < A B C   > ],
    3  => [ < D E F   > ],
    4  => [ < G H I   > ],
    5  => [ < J K L   > ],
    6  => [ < M N O   > ],
    7  => [ < P Q R S > ],
    8  => [ < T U V   > ],
    9  => [ < W X Y Z > ],
   '*' => [ ' '         ],
    0  => [             ],
   '#' => [             ],
};

#-------------------------------------------------------------------------------
#BEGIN ''.put;
#-------------------------------------------------------------------------------

#===============================================================================
sub MAIN
(
    DigitStr:D $S = '249',                        #= String of phone digits (0..9, *, #)
)
#===============================================================================
{
    #"Challenge 067, Task #2: Letter Phone (Raku)\n".put;

    my DigitStr @digits = $S.split: '', :skip-empty;
    my Str      @combinations;

    for @digits -> DigitStr $digit
    {
        my Str @letters = %LETTERS{ $digit }.list;

        if @letters.elems > 0
        {
            if @combinations.elems == 0
            {
                @combinations.push: .lc for @letters;
            }
            else
            {
                my Str @temp-array;

                for @combinations -> Str $combination
                {
                    @temp-array.push: $combination ~ .lc for @letters;
                }

                @combinations = @temp-array;
            }
        }
    }

    "[%s]\n".printf: @combinations.map({ qq["$_"] }).join: ', ';
}

#-------------------------------------------------------------------------------
sub USAGE()
#-------------------------------------------------------------------------------
{
    my Str $usage = $*USAGE;

    $usage ~~ s/ ($*PROGRAM-NAME) /raku $0/;
    $usage.put;
}

################################################################################
