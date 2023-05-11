#!/usr/bin/env perl
use v5.36;

use Carp;
use Getopt::Long;

my $n = 7;
GetOptions( 'number=i' => \$n, );
croak 'Out of range' if $n < 1;

farey($n);

sub farey ( $i ) {
    my %farey;
    for my $d ( 1 .. $i ) {
        for my $n ( 0 .. $d ) {
            my $k = eval( $n / $d );
            $farey{$k} = qq{$n/$d} unless defined $farey{$k};
        }
    }
    my $output = join ', ', map { $farey{$_} } sort { $a <=> $b } keys %farey;

    say <<"END";
Input:  \$n = $i
Output: $output.
END
}
