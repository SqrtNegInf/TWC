#!/usr/bin/env perl
use v5.36;

use File::Slurper qw/ read_lines /;

my @grid      = map { [split('',lc($_))] } read_lines('grid.txt');
my %is_a_word = map { lc($_) => 1        } read_lines('words.txt');
my $num_cols  = int(@{ $grid[0] });
my $num_rows  = int(@grid);
my %found;

scan_grid_for_words();
print_words();

sub scan_grid_for_words {
    for (my $row = 0; $row < $num_rows; ++$row) {
        for (my $col = 0; $col < $num_cols; ++$col) {
            foreach my $row_delta (-1, 0, 1) {
                foreach my $col_delta (-1, 0, 1) {
                    next if $row_delta == 0 && $col_delta == 0;
                    scan_line_for_words($row, $col, $row_delta, $col_delta);
                }
            }
        }
    }
}

sub scan_line_for_words ($row, $col, $row_delta, $col_delta) {
    my $word = "";

    while (on_grid($row,$col)) {
        $word .= $grid[$row][$col];
        $found{$word}++ if $is_a_word{$word};
        $row += $row_delta;
        $col += $col_delta;
    }
}

sub on_grid ($row, $col) {
    return ($row < $num_rows && $row >= 0 && $col >= 0 && $col < $num_cols);
}

sub print_words {
    length > 3 and print "$_\n" for sort keys %found;
}
