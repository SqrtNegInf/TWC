#!/usr/bin/env raku

sub MAIN(Int :$A where { $A >= 1 } = 50,
         Int :$B where { $B >= 1 } = 100) {
    strobogrammatic-numbers($A, $B).join(', ').say;
}

sub strobogrammatic-numbers($start, $stop) {
    die "ERROR: Invalid start number [$start].\n"
        unless $start < $stop;

    my %digits = (6 => 9, 8 => 8, 9 => 6);

    my @strobogrammatic = ();
    for $start .. $stop -> $n {
        next if $n < 10;

        my $found = True;
        my @match = ();
        for $n.comb -> $i {
            if %digits{$i}:exists {
                @match.push: %digits{$i};
            }
            else {
                $found = False;
                last;
            }
        }

        if $found {
            @strobogrammatic.push: $n
                if $n == @match.join('').flip;
        }
    }

    return @strobogrammatic;
}
