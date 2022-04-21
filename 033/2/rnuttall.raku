#!/usr/bin/env raku

sub MAIN($lim = 11) {
    # We can use a single format for all lines
    my         $fmt = "%3s%1s" ~ "%4s" x $lim ~ "\n";
    printf     $fmt,  'x', '|',        1..$lim;
    printf     $fmt, '---','+', '----' xx $lim;
    for 1..$lim -> $x {
        # use xx Sequence repetition to give spaces for lower half of table,
        # use Hyperop «*» to multiply out the visible values
        printf $fmt,  $x,  '|', ' ' xx $x-1, ($x..$lim) «*» $x;
    }
}
