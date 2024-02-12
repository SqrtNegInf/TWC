#!/usr/bin/env perl
use v5.36;

my $s = "Perl"; my $t = "Preel";
odd_character($s, $t);

$s = "Weekly"; $t = "Weeakly";
odd_character($s, $t);

$s = "Box"; $t = "Boxy";
odd_character($s, $t);

exit 0;

sub odd_character {
    my $s = shift;
    my $t = shift;

    my %freq;
    foreach my $c (split //, $s) {
        $freq{$c}++;
    }
    foreach my $c (split //, $t) {
        $freq{$c}--;
    }
    
    printf "%s | %s -> %s\n", $s, $t, map { $_ } grep { $freq{$_} == -1 }keys %freq;

    return undef;
}
