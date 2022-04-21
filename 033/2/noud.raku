#!/usr/bin/env raku

sub print_mult_table($size) {
    # Determine the gap between the numbers.
    my $gap = ceiling(log10($size * $size)) + 1;

    print " " x $gap - 1;
    print "x|";
    for 1..$size -> $i {
        print($i.fmt('%' ~ $gap ~ 'd'));
    }
    print "\n";

    print "-" x $gap ~ "+" ~ "-" x $size * $gap ~ "\n";

    for 1..$size -> $i {
        print $i.fmt('%' ~ $gap ~ 'd') ~ "|" ~ " " x ($i - 1) * $gap;
        for $i..$size -> $j {
            print ($i * $j).fmt('%' ~ $gap ~ 'd');
        }
        print "\n";
    }
}

print_mult_table(3);
print_mult_table(8);
print_mult_table(11);
#print_mult_table(40);
