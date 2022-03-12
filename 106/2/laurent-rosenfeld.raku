#!/usr/bin/env raku

sub MAIN( Int $num = 2, Int $den where $den != 0 = 24  ) {
    my ($non-rep, $repeating) = ($num / $den).base-repeating;
    my $suffix = $repeating ?? "($repeating)" !! "";
    printf '%s%s', $non-rep, $suffix;
}
