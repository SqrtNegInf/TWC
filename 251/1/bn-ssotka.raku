#!/usr/bin/env raku

sub concat (@ints) {
    say "Got ",@ints;
    return 0 unless @ints;
    return @ints[0] if @ints == 1;
    return (@ints[0].Str ~ @ints[*-1].Str).Int + concat(@ints[1..*-2]);
}

#multi MAIN (*@ints){
#    say concat(@ints);
#}
#multi MAIN {
    my @tests = ((6, 12, 25, 1),
                 (10, 7, 31, 5, 2, 2),
                 (1, 2, 10));
    for @tests -> @t {
        say concat(@t);
    }
#}
