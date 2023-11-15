#!/usr/bin/env raku

sub diff (@a, @b) {
    return map {.keys}, @a (-) @b, @b (-) @a;
}

#for (<1 2 3>, < 2 4 6>),  # skip, as per Perl
my @test = (<1 2 3 3>, <1 1 2 2>);
    printf "%-8s - %-8s => ", "@test[0]", "@test[1]";
    say diff @test[0], @test[1];
#}
