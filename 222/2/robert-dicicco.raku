#!/usr/bin/env raku

#unit sub MAIN (*@allints where @allints.elems > 0) {
my @allints = (2, 7, 4, 1, 8, 1);

    say "Input: \@ints = ",@allints;
    loop {
        my @srt = @allints.sort;
        my $ln = @allints.elems - 1;
        if $ln <= 1 {
            say "Output: $ln\n";
            exit;
        } else {
            my $lrg = @srt[$ln];
            my $nxt = @srt[$ln-1];

            my $index =  @allints.first($lrg, :k);
            @allints.splice($index,1);

            $index =  @allints.first($nxt, :k);
            @allints.splice($index,1);

            if ($lrg > $nxt) {
                @allints.prepend($lrg - $nxt);
            }
        }
    }
