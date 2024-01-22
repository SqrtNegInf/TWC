#!/usr/bin/env raku

sub find-squared-specials (@ints) {
    my $n = @ints.elems;
    my $sum = 0;
    for @ints.keys -> $i {
        $sum += @ints[$i] ** 2 if $n %% ($i + 1);
    }
    return $sum;
}
#multi MAIN (*@ints) {
#    my $sum = find-squared-specials(@ints);
#    say $sum;
#}

#multi MAIN () {
    my @tests = (
        (1, 3, 5, 7, 9, 11, 13, 15),
        (1, 2, 3, 4),
        (2, 7, 1, 19, 18, 3)
    );

    for @tests -> @ints {
        say @ints;
        my $sum = find-squared-specials(@ints);
        say "Sum:",$sum;
    }
    
#}
