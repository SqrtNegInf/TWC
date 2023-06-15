#!/usr/bin/env perl
use v5.36;

my @array_1 = qw[ I L O V E Y O U ];
my @array_2 = qw[ 2 4 0 3 2 0 1 9 ];
my @array_3 = qw[ ! ? £ $ % ^ & * ];
my @arrays  = [ \@array_1, \@array_2, \@array_3 ];

display_arrays( \@arrays );

sub display_arrays {
    my $arrays_ref = shift;
    my @arrays     = @$arrays_ref;
    for my $array_ref (@arrays) {
        my @array        = @$array_ref;
        my $max_index   = get_max_index($array_ref);
        my $no_of_arrays = scalar @array;
        for ( my $index = 0; $index < $max_index; $index++ ) {
            for ( my $array_no = 0; $array_no < $no_of_arrays; $array_no++ ) {
                defined @{$array[$array_no]}[$index]
                    ? print @{$array[$array_no]}[$index]
                    : print " ";
                print " ";
            }
            print "\n";
        }
    }
}

sub get_max_index {
    my $array_ref = shift;
    my @arrays    = @$array_ref;
    my $max       = 0;
    for my $array_ref (@arrays) {
        my @array = @$array_ref;
        if ( scalar @array > $max ) {
            $max = scalar @array;
        }
    }
    return $max;
}
