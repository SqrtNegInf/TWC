#!/usr/bin/env perl

use Modern::Perl;
use Path::Tiny;

my($grid_file, $words_file) = ('grid.txt', 'words.txt');

my @grid = parse_grid($grid_file);
my %words = grid_words(5, \@grid);
my @found = find_dict($words_file, \%words);

say join(", ", sort @found);


# parse grid file, return matrix m x n or letters
sub parse_grid {
    my($file) = @_;
    my @grid = path($file)->lines;
    for (@grid) {
        s/\s+//g;
        $_ = [split //, $_];
    }
    return @grid;
}

# extract all possible words with the given minimum length
# from the grid in all 8 directions
sub grid_words {
    my($min_len, $grid) = @_;
    my %words;
    for my $r0 (0 .. $#{$grid}) {
        for my $c0 (0 .. $#{$grid->[0]}) {
            for my $dr (-1 .. 1) {
                for my $dc (-1 .. 1) {
                    if (!($dr==0 && $dc==0)) {
                        my $word = "";
                        for (my $len = 0; 1; $len++) {
                            my($r, $c) = ($r0+$len*$dr, $c0+$len*$dc);
                            last if $r < 0 || $r > $#{$grid} || $c < 0 || $c > $#{$grid->[0]};
                            $word .= $grid->[$r][$c];
                            if (length($word) >= $min_len) {
                                $words{lc($word)} = 1;
                            }
                        }
                    }
                }
            }
        }
    }
    return %words;
}

# return all wards from dictionary that exist in the given hash
sub find_dict {
    my($dict, $words) = @_;
    my @found;
    open(my $fh, "<", $dict) or die "$dict: $!\n";
    while (<$fh>) {
        chomp;
        push @found, $_ if exists $words->{$_};
    }
    return @found;
}
