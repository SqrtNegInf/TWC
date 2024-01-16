#!/usr/bin/env raku

sub MAIN(
    @args  = ([3, 7, 8], [9, 11, 13], [15, 16, 17])
) {
    my @matrix = @args.map({ [ $_.words.map({ .Int }) ] });
    my @mins = @matrix.keys.map({ @matrix[$_].min || -1 });
    my @maxs  = @matrix[0].keys.map({ @matrix[*;$_].max || -1 });

    (@mins ∩ @maxs).keys.join(q{ }).say;
}
