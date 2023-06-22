#!/usr/bin/env perl
use v5.36;

use Test::More tests => 3;

my @sorted_values = ( 1, 2, 2, 2, 3, 5, 5, 6, 6, 7, 7, 8, 8, 8, 8, 9, 9, 10 );
my @test_values = ( 2, 4, 4, 7 );

ok( get_standard(@test_values) eq "1 2 2 4", "standard ranking" );
ok( get_modified(@test_values) eq "1 3 3 4", "modified ranking" );
ok( get_dense(@test_values) eq "1 2 2 3",    "dense ranking" );

# returns Standard Ranking as a string
sub get_standard {
    my @values   = @_;
    my $rankings = "";
    my $position = 0;
    my $rank     = 1;
    foreach (@values) {
        if ( $position == 0 || $_ == $values[ $position - 1 ] ) {
            $position++;
        }
        else {
            $position++;
            $rank = $position;
        }
        $rankings = $rankings . ( $rank . " " );
    }
    $rankings =~ s/\s+$//;
    return $rankings;
}

# returns Modified Ranking as a string
sub get_modified {
    my @values   = @_;
    my $rankings = "";
    my $position = 0;
    my $count    = 0;
    foreach (@values) {
        # Shorten with 1 long if statment which negates the first 2?
        # $position and $count are incremented in each case.
        # Might be harder to read.
        if ( $position == 0 && $_ == $values[ $position + 1 ] ) {
            $position++;
            $count++;
        }
        elsif ( ( $position + 1 ) < scalar @values
            && $_ == $values[ $position + 1 ] )
        {
            $position++;
            $count++;
        }
        else {
            $position++;
            $count++;
            $rankings .= ( ( $position . " " ) x $count );
            $count = 0;
        }
    }
    $rankings =~ s/\s+$//;
    return $rankings;
}

# returns Dense Ranking as a string
sub get_dense {
    my @values   = @_;
    my $rankings = "";
    my $position = 0;
    my $rank     = 1;
    foreach (@values) {
        if ( $position == 0 || $_ == $values[ $position - 1 ] ) {
            $position++;
        }
        else {
            $position++;
            $rank++;
        }
        $rankings .= ( $rank . " " );
    }
    $rankings =~ s/\s+$//;
    return $rankings;
}
