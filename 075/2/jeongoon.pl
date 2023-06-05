#!/usr/bin/env perl

use v5.14; # say, switch
use utf8;
use strict; use warnings;
no warnings "experimental::smartmatch";

use Getopt::Long qw(:config gnu_compat);
use Pod::Usage;
use Term::ANSIColor;
use List::Util qw(min max);

use lib '.';
use CombinationsIndex qw(combinationsIndex);

BEGIN {
    $::utf8   = 1;
    $::colour = 1;

    GetOptions( 
                'utf8!'         => \$::utf8,
                'color|colour!' => \$::colour,
              ) or pod2usage(2);
    if ( $::utf8 ) {
        #binmode( STDERR, ':utf8' );
        binmode( STDOUT, ':utf8' );
    }
}

# solution
sub allPairOfAreaRange {
# return as [ area1, area2 ... ], [ [range1], [range2], ... ] in the same order
    my @H = @_;
    my @range;
    my @area;

    # there are chance one peak data can create the largest area
    push @range, map { [$_, $_] } @H;
    push @area,  map { $_ } @H;       # areas by (width of one) X (each height)

    # range combinations
    my @range_comb = combinationsIndex 2, (scalar @H);
    push @range, @range_comb;
    push @area,  map {
        # my ( $i0, $i1 ) = ( min @$_, max @$_ );
        my ( $i0, $i1 ) = @$_; # combinationsIndex always return sorted values.
        my $common_h    = min @H[ $i0 .. $i1 ];
        $common_h * ( $i1 - $i0 +1 );
    } @range_comb;

    [ @area ], [ @range ]
}

sub getLargestRectArea { max @{ (allPairOfAreaRange@_ )[0] } }

# bonus
sub raku_array { "[".(join ", ", @_)."]" } # from ch-1.pl
# from #074/ch-1.pl
sub ssprintf ($$) { sprintf "%#$_[0]s", $_[1] }
sub map_ssprintf  { map { sprintf "%#$_[0]s", $_ } @_[1..$#_] }
sub u_($) {
    return $_[0] unless $::utf8;
    my $ch;
    for ($_[0]) {
        $ch = '└' when '`';
        $ch = '─' when '-';
        $ch = '│' when '|';
        $ch = '■' when '#';
        default { $ch = $_[0] }
    }
    $ch;
}

sub printLargestRectArea {
    my @H      = @_;
    my @result = allPairOfAreaRange @H;
    my @ar     = @{$result[0]};
    my @rg     = @{$result[1]};

    my $maxh = max @H;                  # max height
    my $ww   = 1 + length $maxh;        # word width

    my $arL   = max @ar;                # area Largest
    my @rgL;

    for my $i ( 0..$#ar ) {
        $ar[$i] == $arL and ( push @rgL, $rg[$i] ) # multiple largest area ??
    }

    say "Input: "  . raku_array( @H );
    say "Output: " . $arL;
    say "Where:";

    for my $y ( reverse 1 .. $maxh ) {
        my $line = ssprintf $ww, $y;
        $line .= u_"|";

        if ( $::colour ) {
            for my $x ( 0 .. $#H ) { # go through histogram data
                my $ch = " ";
                my $x_in_largest_rectangle = 0;
                if ( $H[$x] >= $y ) {
                    for my $r (@rgL) {
                        if ( $$r[0] <= $x and $x <= $$r[1] ) {
                            my $common_h = min @H[ $$r[0] .. $$r[1] ];
                            $x_in_largest_rectangle = $common_h >= $y;
                        }
                    }
                    $line .= colored( [ $x_in_largest_rectangle
                                        ? 'black on_yellow'
                                        :'black on_white' ], ssprintf $ww, u_$ch );
                }
                else {
                    $line .= ssprintf $ww, " ";
                }
            }
        }
        else {
            $line .= join "",
              map_ssprintf $ww, ( map { $_ >= $y ? u_"#" : u_" " } @H );
        }
        say $line;
    }

    say ssprintf( $ww, " " ), u_"`",
      map_ssprintf( $ww, ( (u_("-") x $ww ) x scalar @H ) );
    say ssprintf($ww, " "), " ",map_ssprintf( $ww, @H );
}

# testing
package main;

printLargestRectArea <2 1 4 5 3 7>;
