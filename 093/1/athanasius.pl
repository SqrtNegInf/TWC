#!/usr/bin/env perl
use v5.36;

###############################################################################
=comment

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

=cut
###############################################################################

#--------------------------------------#
# Copyright © 2021 PerlMonk Athanasius #
#--------------------------------------#

use strict;
use warnings;
use Const::Fast;
use Regexp::Common qw( number );
#use lib            qw( . );
#use Line;

{
package Line;

use strict;
use warnings;

use constant EPSILON => 1.11e-16;      #  ~ 2^(-53) for 64-bit double precision

##=============================================================================
## Interface
##=============================================================================

#------------------------------------------------------------------------------
sub new
#------------------------------------------------------------------------------
{
    my ($class, $x1, $y1, $x2, $y2) = @_;
    my  $delta_x       = $x2 - $x1;
    my  $delta_y       = $y2 - $y1;
    my  $is_horizontal = 0;
    my  $is_vertical   = 0;
    my  $gradient;
    my  $x_intercept;
    my  $y_intercept;

    if    (equals( $delta_x, 0 ) &&
           equals( $delta_y, 0 ))
    {
        die sprintf "ERROR: Identical points (%d, %d), (%d, %d) do not " .
                    "define a line\n", $x1, $y1, $x2, $y2;
    }
    elsif (equals( $delta_x, 0 ))
    {
        $is_vertical   = 1;
        $x_intercept   = $x1;
    }
    elsif (equals( $delta_y, 0 ))
    {
        $is_horizontal = 1;
        $gradient      = 0;
        $y_intercept   = $y1;
    }
    else
    {
        $gradient      = $delta_y / $delta_x;
        $x_intercept   = $x1 - ($y1 / $gradient);
        $y_intercept   = $y1 - ($x1 * $gradient);
    }

    my %self = (is_horizontal => $is_horizontal,
                is_vertical   => $is_vertical,
                gradient      => $gradient,
                x_intercept   => $x_intercept,
                y_intercept   => $y_intercept,
                points        => [ [$x1, $y1], [$x2, $y2] ]);

    return bless \%self, $class;
}

#------------------------------------------------------------------------------
sub collinear
#------------------------------------------------------------------------------
{
    my ($self, $rhs) = @_;
    my  $collinear;

    if    ($self->{is_horizontal})
    {
        $collinear = $rhs->{is_horizontal}  &&
                     equals( $self->{y_intercept}, $rhs->{y_intercept} );
    }
    elsif ($self->{is_vertical})
    {
        $collinear = $rhs->{is_vertical}    &&
                     equals( $self->{x_intercept}, $rhs->{x_intercept} );
    }
    else
    {
        $collinear = !$rhs->{is_horizontal} &&    !$rhs->{is_vertical}   &&
                     equals( $self->{gradient},    $rhs->{gradient}    ) &&
                     equals( $self->{x_intercept}, $rhs->{x_intercept} );
    }

    return $collinear;
}

#------------------------------------------------------------------------------
sub add_point
#------------------------------------------------------------------------------
{
    my ($self, $new_point) = @_;
    my  $found = 0;

    for my $existing_point (@{ $self->{points} })
    {
        if (equals( $existing_point->[0], $new_point->[0] ) &&
            equals( $existing_point->[1], $new_point->[1] ))
        {
            $found = 1;
            last;
        }
    }

    push @{ $self->{points} }, $new_point unless $found;
}

#------------------------------------------------------------------------------
sub count_points
#------------------------------------------------------------------------------
{
    my ($self) = @_;

    return scalar @{ $self->{points} };
}

#------------------------------------------------------------------------------
sub show_points                                            # For verbose output
#------------------------------------------------------------------------------
{
    my ($self) = @_;

    return join ', ',
           map { '(' . $_->[0] . ',' . $_->[1] . ')' } @{ $self->{points} };
}

##=============================================================================
## Implementation
##=============================================================================

#------------------------------------------------------------------------------
sub equals
#------------------------------------------------------------------------------
{
    my ($lhs, $rhs) = @_;

    return abs($lhs - $rhs) < EPSILON;
}

1;
}

const my $VERBOSE => 0;
const my $USAGE   =>
"Usage:
  perl $0 [<coords> ...]

    [<coords> ...]    Cartesian plane co-ordinates such as (1.5,-7) or " .
                                                          "(+3,0.2)\n";

#------------------------------------------------------------------------------
BEGIN
#------------------------------------------------------------------------------
{
    #$| = 1;
    #print "\nChallenge 093, Task #1: Max Points (Perl)\n\n";
}

#==============================================================================
MAIN:
#==============================================================================
{
    my @N;

    my @coords  = <(1,1) (2,2) (3,1) (1,3) (5,3)>;
    for my $pair (@coords)
    {
        $pair =~ m{ ^ \( ( $RE{num}{real} ) \, ( $RE{num}{real} ) \) $ }x
            or die qq[ERROR: Malformed coordinate pair "$pair"\n$USAGE];

        push @N, [ 0 + $1, 0 + $2 ];
    }

    @N = sort_and_remove_duplicates( @N );

    printf "Input: %s\n", join ', ',
                          map { '(' . $_->[0] . ',' . $_->[1] . ')' } @N;

    my $max_line = find_max_line( @N );

    if (defined $max_line)
    {
        printf "Output: %d%s\n",
                $max_line->count_points,
                $VERBOSE ? ', viz. ' . $max_line->show_points : '';
    }
    else
    {
        print  "Output: 0\n";
    }
}

#------------------------------------------------------------------------------
sub find_max_line
#------------------------------------------------------------------------------
{
    my (@N) = @_;
    my  $max_line;

    if (scalar @N >= 2)
    {
        my @lines;

        for my $i (0 .. $#N - 1)
        {
            for my $j ($i + 1 .. $#N)
            {
                my $found    = 0;
                my $new_line = Line->new( $N[$i]->[0], $N[$i]->[1],
                                          $N[$j]->[0], $N[$j]->[1] );

                for my $existing_line (@lines)
                {
                    if ($new_line->collinear( $existing_line ))
                    {
                        $existing_line->add_point( $N[$j] );
                        $found = 1;
                        last;
                    }
                }

                push @lines, $new_line unless $found;
            }
        }

        my $max_count = 0;

        for my $line (@lines)
        {
            if ((my $count = $line->count_points) > $max_count)
            {
                $max_count = $count;
                $max_line  = $line;
            }
        }
    }

    return $max_line;
}

#------------------------------------------------------------------------------
sub sort_and_remove_duplicates
#------------------------------------------------------------------------------
{
    my (@N)     = @_;
    my  @sorted = sort { $a->[0] <=> $b->[0] ||
                         $a->[1] <=> $b->[1] } @N;
    my  @unique;
    my  $last;

    for my $point (@sorted)
    {
        if (defined $last && $point->[0] == $last->[0] &&
                             $point->[1] == $last->[1])
        {
            printf "WARNING: Duplicate point (%s,%s)\n", $point->[0],
                                                         $point->[1];
        }
        else
        {
            push @unique, $point;
        }

        $last = $point;
    }

    return @unique;
}

###############################################################################
