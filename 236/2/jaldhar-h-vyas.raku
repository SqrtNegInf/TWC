#!/usr/bin/env raku

sub MAIN(
    @ints= (4,6,3,8,15,0,13,18,7,16,14,19,17,5,11,1,12,2,9,10)
) {
    my %seen;
    my $loops = 1;
    my $current = 0;

    while %seen.keys.elems != @ints.elems {
        if %seen{$current}:exists {
            $loops++;

            for 0 .. @ints.end -> $i {
                if %seen{$i}:!exists {
                    $current = $i;
                    last;
                }
            }
        }

        %seen{$current} = True;
        $current = @ints[$current];
    }

    say $loops;
}
