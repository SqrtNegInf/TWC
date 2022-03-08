#!/usr/bin/env raku

sub MAIN(
    Str $T = '03:10'
) {
    my ($hours, $mins) = $T.split(q{:});

    my $hangle = ($hours % 12) * 30 + ($mins / 60 ) * 30;
    my $mangle = $mins * 6;
    my $diff = abs($hangle - $mangle);
    my $angle = min($diff, 360 - $diff);

    say "$angle degree", ($angle != 1 ?? 's' !! q{}); 
}
