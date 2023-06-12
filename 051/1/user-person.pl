#!/usr/bin/env perl
use v5.36;

my @L = (-25, -10, -7, -3, 2, 4, 8, 10);
my $T = 0;

if (@ARGV) {

    my $input   = "@ARGV";
    my %digSeen = ();
    $input =~ s{[][)(, ]+}{ }g;
    $input =~ s{\A\s+|\s+\Z}{};
    @L = split m{ }, $input;

    foreach (@L) {
        $_ =~ s{\A0+\Z}{0};
        $_ =~ s{\A0+(-?\d+)}{$1};
    }

    @L = sort { $a <=> $b } @L;

} else {
    my $prettyL = join ', ', @L;
    print "Using default input \@L: [$prettyL]\n";

}

my %seen = ();

for         ( my $i =    0; $i <= $#L-2; ++$i ) {
    for     ( my $j = $i+1; $j <= $#L-1; ++$j ) {
      INNER:
        for ( my $k = $j+1; $k <= $#L  ; ++$k ) {

            my $sum = $L[$i] + $L[$j] + $L[$k];

            if ($sum == $T) {
                my $string = "$L[$i] + $L[$j] + $L[$k] = $T";
                if (exists($seen{$string})) {
                    next INNER;
                } else {
                    print $string . "\n" if $sum == $T;
                    $seen{$string}++;
                }
            }
        }
    }
}

__END__
output:

Using default input @L: [-25, -10, -7, -3, 2, 4, 8, 10]
-10 + 2 + 8 = 0
-7 + -3 + 10 = 0
