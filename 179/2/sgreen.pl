#!/usr/bin/env perl
use v5.36;
use List::Util qw(min max);

sub main (@numbers) {
    my @bar      = (qw'▁ ▂ ▃ ▄ ▅ ▆ ▇ █');
    my $barcount = scalar(@bar);

    my $mn        = min(@numbers);
    my $mx        = max(@numbers);
    my $extent    = $mx - $mn;
    my $sparkline = '';

    foreach my $n (@numbers) {
        $sparkline .= $bar[ min( $barcount - 1, int( ( $n - $mn ) / $extent * $barcount ) ) ];
    }

    say $sparkline;
}

main((15,2500,35,-4500,55,65,75,8500));
