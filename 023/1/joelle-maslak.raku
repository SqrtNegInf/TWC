#!/usr/bin/env raku

#sub MAIN(UInt:D $nth, *@sequence) {
    my $nth=1;
    my @sequence=(5, 9, 2, 8, 1, 6);
    die "Only provide numbers" if @sequence.first( { $_ !~~ m:s/^ <[ 0 .. 9 ]>+ $/ } ).defined;

    my @in = @sequence;
    for 1..$nth {
        @sequence = ();
        my $last;
        for @in -> $num {
            @sequence.push: $num - $last if $last.defined;
            $last = $num;
        }
        @in = @sequence;
    }

    say @sequence.join(" ");
#}
