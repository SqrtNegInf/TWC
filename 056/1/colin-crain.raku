#!/usr/bin/env raku

srand 1;

sub MAIN (Int:D $k = 24, *@N) {

    my @input = @N.elems > 0 ?? @N !! (^20).map({ (1..50).pick }).sort({ $^a <=> $^b });
    my @indices = (^@input.elems);
    my @output;

    my @is = @indices.grep({ @input[$_] > $k });

    ## for each $i we can do a lookup and see whether any values $input[$j] = $input[$i] - $k exist
    for @is -> $i {
        my @js = @indices.grep({    @input[$_] <= @input[$i]           ## A[j] <= A[i]
                                 && @input[$_] == @input[$i] - $k      ## A[i] - A[j] = k
                                 &&         $_ != $i});                ## i != j
        for @js -> $j { @output.push: [ $i, $j ] }
    }

    ## output report section
    say "input\n-----\n";
    say ' array: ' ~ @input.join: ', ',;

    say "target: $k";
    say '';

    say "solutions\n---------\n";

    my $format = "i = %2d, j = %-2d --> %2d - %-2d = %d\n";
    printf $format, $_[0], $_[1], @input[$_[0]], @input[$_[1]], $k for @output;
}
