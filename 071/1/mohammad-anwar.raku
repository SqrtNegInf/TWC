#!/usr/bin/env raku

srand 1;

sub MAIN(Int :$N where { $N > 1 } = 10) {
    my @random-array  = [42, 12, 50, 24, 19, 2, 8, 38, 45, 11, 4, 41, 29, 32, 5, 30, 48, 47, 9, 18];
    #my @random-array  = random-array($N);
    my @peak-elements = find-peak-elements-in(@random-array);

    say sprintf("Array: [%s]", join ', ', @random-array);
    say sprintf(" Peak: [%s]", join ', ', @peak-elements);
}

#
#
# METHODS

sub find-peak-elements-in($array where { $_ > 0 }) {

    my @peak-elements = Empty;
    if $array.elems >= 2 {

        if ($array[0] > $array[1]) {
            @peak-elements.push: $array[0];
        }

        for 1 .. $array.elems-2 -> $i {
            if $array[$i] > $array[$i-1]
               &&
               $array[$i] > $array[$i+1] {

               @peak-elements.push: $array[$i];
            }
        }

        if $array[*-1] > $array[*-2] {
            @peak-elements.push: $array[*-1];
        }
    }

    return |@peak-elements;
}

sub random-array(Int $size is copy) {

    my %elements = ();
    while $size >= 1 {
        my $element = (^50).pick;
        next if %elements{$element}:exists;
        %elements{$element} = 1;
        $size--;
    }

    return (%elements.keys);
}
