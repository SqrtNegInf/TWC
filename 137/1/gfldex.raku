#!/usr/bin/env raku
# from https://gfldex.wordpress.com/2021/11/08/2nd-class-join/

# flat output

multi sub infix:«|,»(\left, \right) is equiv(&infix:<Z>) { |left, |right }
multi sub infix:«|xx»(Mu \left, Mu \right) is equiv(&infix:<xx>) { (left xx right).flat }

say (1900..2100).grep({ Date.new(.Int, 1, 1).day-of-week | Date.new(.Int, 12, 31).day-of-week == 4 });

say "\n--\n";

# better output, but longer code
put ( (1900..2100).grep({ Date.new(.Int, 1, 1).day-of-week | Date.new(.Int, 12, 31).day-of-week == 4 }) Z (' ' xx 7 |, $?NL) |xx ∞ ).flat.head(*-1).join('');

say "\n--\n";

# smart join
# Now we can use (the sadly under-used) feed operator. 

multi sub smart-join(Seq:D \separator, *@l --> Str:D) {
    my $ret;
    my $sep-it = separator.iterator;
    my $list-it = @l.iterator;

    loop {
        my $e := $list-it.pull-one;
        last if $e =:= IterationEnd;

        $ret ~= $e;
        $ret ~= $sep-it.pull-one if $list-it.bool-only;
    }

    $ret
}

1900..2100
==> grep({ Date.new(.Int, 1, 1).day-of-week | Date.new(.Int, 12, 31).day-of-week == 4 })
==> smart-join( (' ' xx 7 |, $?NL) |xx ∞ )
==> say();

say "\n--\n";

# The lazy list that
# is generating the alternating separators might be a bit slow. If we go
# functional the code, both for smart-join and the alternator, gets simpler.

multi sub smart-join(&separators, *@l --> Str:D) {
    my $ret;

    while @l {
        $ret ~= @l.shift;
        $ret ~= separators if +@l;
    }

    $ret
}

1900..2100
==> grep({ Date.new(.Int, 1, 1).day-of-week | Date.new(.Int, 12, 31).day-of-week == 4 })
==> smart-join({ ++$ %% 8 ?? $?NL !! ' '})
==> say();
