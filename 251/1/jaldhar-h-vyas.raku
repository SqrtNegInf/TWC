#!/usr/bin/env raku

#sub MAIN(
  my  @ints  = (10, 7, 31, 5, 2, 2);
#) {
    my $total = 0;

    while @ints.elems > 1 {
        $total += @ints.shift ~ @ints.pop;
    }

    if @ints.elems {
        $total += @ints[0];
    }

    say $total;
#}
