#!/usr/bin/env raku

my @myints = ([15, 99, 1, 34],[50, 25, 33, 22]);

sub Reduce ( $num is copy) {
    if $num < 0 or $num > 99 {return 0;}
    my $steps = 0;
    while $num > 9 {
        $num = (floor($num/10)) × ($num % 10);
        $steps++;
    }
    return $steps;
}

for (@myints) -> @mints {
    my $cnt = 0;
    my %h;
    say "Input: @int = ["~@mints~"]";
    while $cnt < @mints.elems {
        my $retval = Reduce(@mints[$cnt]);
        %h{@mints[$cnt]} = $retval;
        $cnt++;
    }
    print "Output: [ ";
    for %h.sort: *.invert {
        print .key ~ " ";
    }
    say "]\n";
}
