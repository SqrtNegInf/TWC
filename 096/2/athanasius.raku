#!/usr/bin/env raku

###############################################################################
=begin comment

Perl Weekly Challenge 096
=========================

Task #2
-------
*Edit Distance*

Submitted by: Mohammad S Anwar

You are given two strings $S1 and $S2.

Write a script to find out the minimum operations required to convert $S1 into
$S2. The operations can be insert, remove or replace a character. Please check
out [https://en.wikipedia.org/wiki/Edit_distance |Wikipedia] page for more in-
formation.

Example 1:

 Input: $S1 = "kitten"; $S2 = "sitting"
 Output: 3

 Operation 1: replace 'k' with 's'
 Operation 2: replace 'e' with 'i'
 Operation 3: insert 'g' at the end

Example 2:

 Input: $S1 = "sunday"; $S2 = "monday"
 Output: 2

 Operation 1: replace 's' with 'm'
 Operation 2: replace 'u' with 'o'

=end comment
###############################################################################

#--------------------------------------#
# Copyright © 2021 PerlMonk Athanasius #
#--------------------------------------#

#==============================================================================
=begin comment

Since the allowable operations are given as "insert, remove or replace a
character", we may assume that the edit distance required in this Task is the
Levenshtein distance.

A single insert, remove, or replace operation is assigned a cost of one. To
determine the minimum overall cost, the dynamic-programming Wagner-Fischer
algorithm is used. A Matrix class is provided to facilitate implementation of
the algorithm.

The Wagner-Fischer algorithm is not the fastest, but it does create a full
matrix which can then be used to reconstruct the changes by which the first
string has been transformed into the second. If the $EXPLAIN constant below is
set to True, the minimum operations required to transform $S1 into $S2 will be
listed in the output below the Levenshtein distance. If both $EXPLAIN and
$SHOW-MATRIX are True, the matrix generated by the Wagner-Fischer algorithm is
also displayed.

=end comment
#==============================================================================

use lib < . >;
use Matrix;

my Bool constant $EXPLAIN     = True;
my Bool constant $SHOW-MATRIX = False;

#------------------------------------------------------------------------------
BEGIN
#------------------------------------------------------------------------------
{
    #"\nChallenge 096, Task #2: Edit Distance (Raku)\n".put;
}

#==============================================================================
sub MAIN
(
    Str:D $S1 = 'little',                        #= First  string
    Str:D $S2 = 'sitting'                         #= Second string
)
#==============================================================================
{
    qq[Input:  \$S1 = "%s"; \$S2 = "%s"\n].printf: $S1, $S2;

    my (UInt $distance, Matrix $matrix) = levenshtein-distance($S1, $S2);

    qq[Output: %d (Levenshtein distance)\n].printf: $distance;

    if $EXPLAIN
    {
        "\n%s".printf: $matrix.display if $SHOW-MATRIX;

        my Array:D[UInt:D] @path = trace-path($matrix);
        my Str             $ops  = find-ops(@path, $S1, $S2);

        print "\n$ops" if $ops;
    }
}

#------------------------------------------------------------------------------
sub levenshtein-distance( Str:D $s, Str:D $t --> List:D[UInt:D, Matrix:D] )
#------------------------------------------------------------------------------
{
    my Matrix $matrix = Matrix.new(S1 => $s, S2 => $t);
    my Str    @s      = "#$s".split: '', :skip-empty;
    my Str    @t      = "#$t".split: '', :skip-empty;

    for 1 .. @t.end -> UInt $row
    {
        for 1 .. @s.end -> UInt $col
        {
            my UInt $del-cost = $matrix.element($row - 1, $col    ) + 1;
            my UInt $ins-cost = $matrix.element($row,     $col - 1) + 1;
            my UInt $sub-cost = $matrix.element($row - 1, $col - 1) +
                                  ((@t[ $row ] eq @s[ $col ]) ?? 0 !! 1);

            $matrix.element($row, $col, ($del-cost, $ins-cost, $sub-cost).min);
        }
    }

    return $matrix.element(@t.end, @s.end), $matrix;
}

#------------------------------------------------------------------------------
sub trace-path( Matrix:D $matrix --> Seq:D[Array:D[UInt:D]] )
#------------------------------------------------------------------------------
{
    my UInt        $row  = $matrix.height - 1;
    my UInt        $col  = $matrix.width  - 1;
    my UInt        $min  = $matrix.element($row, $col).UInt;
    my Array[UInt] @path = Array[Array[UInt]].new;

    @path.push: Array[UInt].new( $row, $col, $min );

    until $row == 0 && $col == 0
    {
        if    $col == 0
        {
            $min = $matrix.element(--$row,   $col);         # Move up:   insert
        }
        elsif $row == 0
        {
            $min = $matrix.element(  $row, --$col);         # Move left: delete
        }
        else
        {
            my UInt $up   = $matrix.element($row - 1, $col    );
            my UInt $left = $matrix.element($row,     $col - 1);
            my UInt $diag = $matrix.element($row - 1, $col - 1);

            if    $diag <= $up   && $diag <= $left
            {                                               # Move up and left:
                $min = $matrix.element(--$row, --$col);     #           replace
            }
            elsif $up   <= $diag && $up   <= $left
            {
                $min = $matrix.element(--$row,   $col);     # Move up:   insert
            }
            else
            {
                $min = $matrix.element(  $row, --$col);     # Move left: delete
            }
        }

        @path.push: Array[UInt].new( $row, $col, $min );
    }

    return @path.reverse;
}

#------------------------------------------------------------------------------
sub find-ops( Array:D[Array:D[UInt:D]] $path, Str:D $s, Str:D $t --> Str:D )
#------------------------------------------------------------------------------
{
    my Str         $summary = '';
    my Array[UInt] $last    = $path.shift;
    my UInt        $count   = 0;

    while $path
    {
        my Array[UInt] $next = $path.shift;

        if $next[2] > $last[2]
        {
            my Str $op;

            if    $next[0] == $last[0]
            {
                $op = "remove '%s'".sprintf: $s.substr: $next[1] - 1, 1;
            }
            elsif $next[1] == $last[1]
            {
                $op = "insert '%s'".sprintf: $t.substr: $next[0] - 1, 1;
            }
            else
            {
                $op = "replace '%s' with '%s'".sprintf:
                                             $s.substr( $next[1] - 1, 1 ),
                                             $t.substr( $next[0] - 1, 1 );
            }

            $summary ~= sprintf "Operation %d: %s\n", ++$count, $op;
        }

        $last = $next;
    }

    return $summary;
}

#------------------------------------------------------------------------------
sub USAGE()
#------------------------------------------------------------------------------
{
    my Str $usage = $*USAGE;

    $usage ~~ s/ ($*PROGRAM-NAME) /raku $0/;
    $usage.put;
}

##############################################################################
