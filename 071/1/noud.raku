#!/usr/bin/env raku
srand 1;;

sub random_array($N) {
    return (1..50).pick(1..$N);
}

sub get_peaks(@a) {
    if (@a.elems == 1) {
        return @a;
    }
    return [
        |([@a[0] if @a[0] > @a[1]]),
        |([@a[$_] if ((@a[$_] > @a[$_ + 1]) and (@a[$_] > @a[$_ - 1])) for 1..(@a.elems - 2)]),
        |([@a[*-1] if @a[*-1] > @a[*-2]])
    ];
}

my @a = random_array(10);
my @peaks = get_peaks(@a);

@a.say;
@peaks.say;
