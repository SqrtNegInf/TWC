#!/usr/bin/env perl
use v5.36;

chomp( my $size_of_matrix = 5 );

my @matrix = create_identity_matrix($size_of_matrix);
print_matrix( \@matrix );

sub create_identity_matrix {
    my $size_of_matrix = shift;
    my @matrix;
    for ( my $i = 0; $i < $size_of_matrix; $i++ ) {
        $matrix[$i] = [ (0) x $size_of_matrix ];
        $matrix[$i][$i] = 1;
    }
    return @matrix;
}

sub print_matrix {
    my $matrix_ref = shift;
    my @matrix     = @{$matrix_ref};
    for (@matrix) {
        say "@{$_}";
    }
}
