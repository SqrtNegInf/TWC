#!/usr/bin/env raku

###############################################################################
=begin comment

Perl Weekly Challenge 093
=========================

Task #1
-------
*Max Points*

Submitted by: Mohammad S Anwar

You are given set of co-ordinates @N.

Write a script to count maximum points on a straight line when given co-
ordinates plotted on a 2-d plane.

Example 1:

 |
 |     *
 |   *
 | *
 + _ _ _ _

 Input: (1,1), (2,2), (3,3)
 Output: 3

Example 2:

 |
 |
 | *       *
 |   *
 | *   *
 + _ _ _ _ _

 Input: (1,1), (2,2), (3,1), (1,3), (5,3)
 Output: 3

=end comment
###############################################################################

#--------------------------------------#
# Copyright © 2021 PerlMonk Athanasius #
#--------------------------------------#

#use lib '.';
#use Line;

my Real constant $EPSILON = 1.11e-16;  #  ~ 2^(-53) for 64-bit double precision

###############################################################################
class Line {
###############################################################################

has Bool $.is-horizontal = False;
has Bool $.is-vertical   = False;
has Real $.gradient;
has Real $.x-intercept;
has Real $.y-intercept;
has Pair @!points;

##=============================================================================
## Interface
##=============================================================================

#------------------------------------------------------------------------------
method collinear( Line:D $rhs --> Bool:D )
#------------------------------------------------------------------------------
{
    my Bool $collinear;

    if    $!is-horizontal
    {
        $collinear = $rhs.is-horizontal  &&
                     equals( $!y-intercept,  $rhs.y-intercept );
    }
    elsif $!is-vertical
    {
        $collinear = $rhs.is-vertical    &&
                     equals( $!x-intercept,  $rhs.x-intercept );
    }
    else
    {
        $collinear = !$rhs.is-horizontal && !$rhs.is-vertical   &&
                     equals( $!gradient,     $rhs.gradient    ) &&
                     equals( $!x-intercept,  $rhs.x-intercept );
    }

    return $collinear;
}

#------------------------------------------------------------------------------
method add-point( Pair:D $new-point )
#------------------------------------------------------------------------------
{
    my Bool $found = False;

    for @!points -> Pair $existing-point
    {
        if equals( $existing-point.key,   $new-point.key   ) &&
           equals( $existing-point.value, $new-point.value )
        {
            $found = True;
            last;
        }
    }

    @!points.push: $new-point unless $found;
}

#------------------------------------------------------------------------------
method count-points( --> UInt:D )
#------------------------------------------------------------------------------
{
    return @!points.elems;
}

=begin comment
#------------------------------------------------------------------------------
method show()                                                   # For debugging
#------------------------------------------------------------------------------
{
    "----\nLine:".put;
    "Gradient:    %s\n".printf: $!is-horizontal ?? '0 (horizontal)' !!
                                $!is-vertical   ?? 'Inf (vertical)' !!
                                $!gradient;
    "X-intercept: %s\n".printf: $!x-intercept if $!x-intercept.defined;
    "Y-intercept: %s\n".printf: $!y-intercept if $!y-intercept.defined;
    "Points: %s\n".\    printf: @!points.map( { sprintf "(%d,%d)", .kv } ).\
                                         join: ', ';
    '===='.put;
}
=end comment

#------------------------------------------------------------------------------
method show-points( --> Str:D )                            # For verbose output
#------------------------------------------------------------------------------
{
    return @!points.map( { "({ .key },{ .value })" } ).join: ', ';
}

##=============================================================================
## Implementation
##=============================================================================

#------------------------------------------------------------------------------
submethod BUILD( Real:D :$x1, Real:D :$y1, Real:D :$x2, Real:D :$y2 )
#------------------------------------------------------------------------------
{
    my Real $delta-x = $x2 - $x1;
    my Real $delta-y = $y2 - $y1;

    if    equals( $delta-x, 0 ) &&
          equals( $delta-y, 0 )
    {
        die "ERROR: Identical points ($x1, $y1), ($x2, $y2) do not define a " ~
            'line';
    }
    elsif equals( $delta-x, 0 )
    {
        $!is-vertical   = True;
        $!gradient      = ∞;
        $!x-intercept   = $x1;
    }
    elsif equals( $delta-y, 0 )
    {
        $!is-horizontal = True;
        $!gradient      = 0;
        $!y-intercept   = $y1;
    }
    else
    {
        $!gradient      = $delta-y / $delta-x;
        $!x-intercept   = $x1 - ($y1 / $!gradient);
        $!y-intercept   = $y1 - ($x1 * $!gradient);
    }

    @!points.push: $x1 => $y1, $x2 => $y2;
}

#------------------------------------------------------------------------------
sub equals( Real:D $lhs, Real:D $rhs --> Bool:D )
#------------------------------------------------------------------------------
{
    return abs($lhs - $rhs) < $EPSILON;
}

}

###############################################################################
my Bool constant $VERBOSE = False;

my regex REAL { [ \+ || \- ]? <[ 0 .. 9 ]>+ [ \. <[ 0 .. 9 ]>+ ]? };


#------------------------------------------------------------------------------
BEGIN
#------------------------------------------------------------------------------
{
    #"\nChallenge 093, Task #1: Max Points (Raku)\n".put;
}

#==============================================================================
sub MAIN
(
)
#==============================================================================
{
    my @coords  = <(1,1) (2,2) (3,1) (1,3) (5,3)>;
    my Pair @N;

    for @coords -> Str $pair
    {
        $pair ~~ rx{ ^ \( ( <REAL> ) \, ( <REAL> ) \) $ }
            or error( qq[Malformed coordinate pair "$pair"] );

        @N.push: $0.Num => $1.Num;
    }

    @N = sort-and-remove-duplicates( @N );

    "Input: %s\n"\.printf: @N.map( { sprintf '(%s,%s)', .kv } ).join: ', ';

    if (my Line $max-line = find-max-line( @N )).defined
    {
        "Output: %d%s\n".printf:
            $max-line.count-points,
            $VERBOSE ?? ', viz. ' ~ $max-line.show-points !! '';
    }
    else
    {
        'Output: 0'.put;
    }
}

#------------------------------------------------------------------------------
sub find-max-line( Pair:D @N --> Line )
#------------------------------------------------------------------------------
{
    my Line $max-line;

    if @N.elems >= 2
    {
        my Line @lines;

        for 0 .. @N.end - 1 -> UInt $i
        {
            for $i + 1 .. @N.end -> UInt $j
            {
                my Bool $found    = False;
                my Line $new-line = Line.new\
                                    (
                                        x1 => @N[$i].key, y1 => @N[$i].value,
                                        x2 => @N[$j].key, y2 => @N[$j].value,
                                    );

                for @lines -> Line $existing-line
                {
                    if $new-line.collinear( $existing-line )
                    {
                        $existing-line.add-point( @N[$j] );
                        $found = True;
                        last;
                    }
                }

                @lines.push: $new-line unless $found;
            }
        }

        my UInt $max-count = 0;

        for @lines -> Line $line
        {
            if (my UInt $count = $line.count-points) > $max-count
            {
                $max-count = $count;
                $max-line  = $line;
            }
        }
    }

    return $max-line;
}

#------------------------------------------------------------------------------
sub sort-and-remove-duplicates( Pair:D @N --> Array:D[Pair:D] )
#------------------------------------------------------------------------------
{
    my Pair @sorted = @N.sort: { $^a.key   <=> $^b.key ||
                                 $^a.value <=> $^b.value };
    my Pair @unique;
    my Pair $last;

    for @sorted -> $point
    {
        if $point === $last
        {
            "WARNING: Duplicate point ({ $point.key },{ $point.value })".note;
        }
        else
        {
            @unique.push: $point;
        }

        $last = $point;
    }

    return @unique;
}

#------------------------------------------------------------------------------
sub USAGE()
#------------------------------------------------------------------------------
{
    my Str $usage = $*USAGE;

    $usage ~~ s/ ($*PROGRAM-NAME) /raku $0/;
    $usage.put;
}

#------------------------------------------------------------------------------
sub error( Str:D $message )
#------------------------------------------------------------------------------
{
    "ERROR: $message".put;
    USAGE();

    exit;
}

##############################################################################
