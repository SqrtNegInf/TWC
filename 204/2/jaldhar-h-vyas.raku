#!/usr/bin/env raku

sub MAIN(
    $r = 3,
    $c = 2,
    @args = ([ 1, 2, 3 ], [ 4, 5, 6 ])
) {
    my @input = @args.map({ $_.split(/\s/).map({ $_.Int; }); }).flat;

    if $r * $c > @input.elems {
        say 0;
        exit;
    }

    my @output;

    for 0 ..^ $r {
        my @temp;
        for 0 ..^ $c {
            @temp.push(@input.shift);
        }
        @output.push(@temp);
    }

    if (@output.elems > 1) {
        print '[ ';
    }

    @output.map({ '[ ' ~ @$_.join(q{, }) ~ ' ]' }).join(q{, }).print;

    if (@output.elems > 1) {
        print ' ]';
    }

    print "\n";
}
