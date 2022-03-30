#!/usr/bin/env raku

#------------------------------------------------------------------------------
BEGIN
#------------------------------------------------------------------------------
{
    #"\nChallenge 078, Task #2: Left Rotation (Raku)\n".put;
}

##=============================================================================
sub MAIN
(
)
##=============================================================================
{
    my @A = (10,20,30,40,50); my @B = (3,4);
    my @A-orig = @A;

    'Input:'.put;

    "    \@A = (%s)\n"  .printf: @A.join: ' ';
    "    \@B = (%s)\n\n".printf: @B.join: ' ';

    'Output:'.put;

    for @B -> UInt $b
    {
        my UInt @A = @A-orig;

        # Raku's built-in rotate() method:
        #
        #     multi method rotate(List:D: Int:D $n = 1 --> List:D)
        #
        # "Returns the list rotated by $n elements" - i.e., left-rotated, which
        # makes it ideal for solving this Task

        @A = @A.rotate($b);

        "    [%s]\n".printf: @A.join: ' ';
    }
}

#------------------------------------------------------------------------------
sub parse-A( Str:D $A --> Array:D[UInt:D] )
#------------------------------------------------------------------------------
{
    my UInt @A;

    for $A.split: / \s+ /, :skip-empty -> Str $a
    {
        my Str $v = val($a);

        $v.^name eq 'IntStr' or error("Non-integer '$a' in \@A");

        my Int $i = $v.Int;

        $i > 0               or error("Non-positive '$i' in \@A");

        @A.push: $i;
    }

    return @A;
}

#------------------------------------------------------------------------------
sub parse-B( Str:D $B, UInt:D $max --> Array:D[UInt:D] )
#------------------------------------------------------------------------------
{
    my UInt @B;

    for $B.split: / \s+ /, :skip-empty -> Str $b
    {
        my Str $v = val($b);

        $v.^name eq 'IntStr'
                    or error("Non-integer '$b' in \@B");

        my Int $i = $v.Int;

        $i >= 0     or error("Index $i out of range in \@B (must be >= 0)");
        $i <= $max  or error("Index $i out of range in \@B (must be <= $max)");

        @B.push: $i;
    }

    return @B;
}

#------------------------------------------------------------------------------
sub error( Str:D $message )
#------------------------------------------------------------------------------
{
    "ERROR: $message".put;

    USAGE();

    exit;
}

#------------------------------------------------------------------------------
sub USAGE()
#------------------------------------------------------------------------------
{
    my Str $usage = $*USAGE;

    $usage ~~ s/ ($*PROGRAM-NAME) /raku $0/;
    $usage.put;
}

###############################################################################
