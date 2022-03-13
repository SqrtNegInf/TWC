#!/usr/bin/env raku

sub MAIN(
    Int $N = 20
) {
    my $wasHash = 0;
    my @hash-counting;
    my $pos = $N;

    while $pos > 0 {
        if $wasHash {
            @hash-counting.unshift("$wasHash");
            $pos -= "$wasHash".chars;
            $wasHash = 0;
        } else {
            @hash-counting.unshift('#');
            $wasHash = $pos;
            $pos--;
        }
    }

    @hash-counting.join(q{}).say;
}
