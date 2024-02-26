#!/usr/bin/env raku

sub isRREF(@matrix) {
    my $leading = -1;
    my $zeroCol = False;

    for @matrix.keys -> $row {
        my $currentLeading = -1;
        for @matrix[$row].keys -> $col {
            if @matrix[$row;$col] == 1 {
                $currentLeading = $col;
                last;
            }
        }

        if $currentLeading == -1 {
            if @matrix[$row].any > 0 {
                return False;
            }

            $zeroCol = True;
            next;
        }
        
        if $zeroCol {
            return False;
        }

        if $currentLeading < $leading {
            return False;
        }

        $leading = $currentLeading;

        if @matrix[*;$leading].grep({ $_ > 0 }) > 1 {
            return False;
        }
    }
    
    return True;
}

    my @matrix = ([1, 0, 0, 1], [0, 1, 0, 2], [0, 0, 1, 3]);
    say @matrix.gist;

    say isRREF(@matrix) ?? 1 !! 0;
