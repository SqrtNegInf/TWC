#!/usr/bin/env perl

use Modern::Perl;

sub van_eck_iter {
    my @hist;
    my @init = (0, 0);      # first two terms
    return sub {
        if (@init) {
            push @hist, shift @init;
            return $hist[-1];
        }
        else {
            for my $m (reverse 0 .. $#hist-1) {
                if ($hist[$m]==$hist[-1]) {
                    push @hist, $#hist - $m;
                    return $hist[-1];
                }
            }
            push @hist, 0;
            return $hist[-1];
        }
    };
}

my $iter = van_eck_iter();
my $sep = "";
for (0..96) {
    print $sep, $iter->();
    $sep = ", ";
}
print "\n";
