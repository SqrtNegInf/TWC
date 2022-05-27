#!/usr/bin/env raku
# from https://gfldex.wordpress.com/2021/09/24/convolution/

sub consecutive-a(*@a) {
    my @ret;

    gather {
        for (|@a, |@a.tail).rotor( 2 => -1 ) -> [$a, $b] {
            @ret.push: $a;
            unless $b == $a + 1 {
                take @ret;
                @ret = [];
            }
        }
    }
}

sub consecutive-b(*@a) {
    my @gaps = @a.rotor(2 => -1).kv.grep(-> $index, [$a, $b] { $b !== $a + 1 })[*;0];
    return @a unless @gaps;
    @gaps = (@gaps Z @gaps »+» 1).flat;
    my $ranges := (0, @gaps, (@a - 1)).flat.map(-> \l, \r { l .. r });

    @a[$ranges]
}

sub MAIN() {
    my @examples := (1, 2, 3, 6, 7, 8, 9)
                  ,(11, 12, 14, 17, 18, 19)
                  ,(2, 4, 6, 8)
                  ,(1, 2, 3, 4, 5);

    .&consecutive-a.say for @examples;
    say();
    .&consecutive-b.say for @examples;
}
