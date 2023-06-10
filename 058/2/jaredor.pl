#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use List::Util qw(all any);
use List::MoreUtils qw(uniq indexes last_index);

sub procedural_ordered_lineup {
    return sub {
        my @HTP = sort { $b->[0] <=> $a->[0] } @_;
        my @A = (undef) x ( 2 * @HTP );
        while (@HTP) {
            my ( $h, $t ) = @{ pop @HTP };
            $A[ ( indexes { not defined $_ } @A )[$t] ] = $h;
        }
        return @A[ 0 .. last_index { defined $_ } @A ];
      }
}

sub recursive_ordered_lineup {
    return sub {
        my @HTR = sort { $b->[0] <=> $a->[0] } @_;
        sub slot_by_smallest {
            my ( @bigger, @list ) = @_;
            my ( $h,      $t )    = @{ pop @bigger };
            @list = slot_by_smallest(@bigger) if @bigger;
            $#list = $t if @list < $t;
            splice @list, $t, 0, $h;
            return @list;
        }
        return slot_by_smallest @HTR;
      }
}

sub catch_undef {
    my ( $OL, ) = @_;
    return sub {
        my @A = $OL->(@_);
        @A = () unless all { defined $_ } @A;
        return @A;
      }
}

sub catch_impossible {
    my ( $OL, ) = @_;
    return sub {
        my @A = ();
        @A = $OL->(@_) unless any { $_->[1] < 0 or $_->[1] >= @_ } @_;
        return @A;
      }
}

sub report_result_of {
    my $OL = catch_undef catch_impossible $_[0];
    return sub {
        if ( not @_ ) { warn "No information given for Ordered Lineup."; }
        else {
            my @A = $OL->(@_);
            if (@A) { print join( ' ', @A ), "\n" if @A; }
            else    { warn "The requested Ordered Lineup is not possible."; }
        }
      }
}

Getopt::Long::Configure( 'bundling_values', 'ignorecase_always',
    'pass_through' );

my ( $recursive, @H, @T, ) = ( '', );

@H = qw(2 6 4 5 1 3);
@T = qw(1 0 2 0 1 2);
#my @A = qw(5 1 2 6 3 4);
GetOptions(
    'recursive!'   => \$recursive,
    'height=i{1,}' => \@H,
    'taller=i{1,}' => \@T,
) or die "Problem with GetOptions.";

die "The list of --height arguments need to be a list of unique elements"
  unless @H == uniq @H;

die "Number of --taller arguments must equal the number of --height arguments"
  unless @T == @H;

my @HT = map { [ $H[$_], $T[$_] ] } 0 .. $#H;

my $ordered_lineup = $recursive ? recursive_ordered_lineup
                                : procedural_ordered_lineup;

(report_result_of $ordered_lineup)->(@HT);
