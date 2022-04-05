#!/usr/bin/env raku


sub MAIN ( Int $input = 527  ) {

   my @digits = $input.comb;

    my %encode = (  2  =>  ("a", "b", "c"),
                    3  =>  ("d", "e", "f"),
                    4  =>  ("g", "h", "i"),
                    5  =>  ("j", "k", "l"),
                    6  =>  ("m", "n", "o"),
                    7  =>  ("p", "q", "r", "s"),
                    8  =>  ("t", "u", "v"),
                    9  =>  ("w", "x", "y", "z")  );

    my @list = |%encode{@digits.shift};

    @list = make_strings(%encode, @digits, @list);
    .say for @list;

}

sub make_strings (%encode, @digits, @list) {
    return @list unless @digits.elems > 0;

    my @newlist;
    my $digit = @digits.shift;
    for @list -> $str {
        for ( %encode{$digit}.list ) {
            @newlist.push: $str ~ $_;
        }
    }
    return make_strings( %encode, @digits, @newlist);
}
