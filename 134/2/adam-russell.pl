#!/usr/bin/env perl
use v5.36;

sub compute_print {
    my ( $m, $n ) = @_;
    my $distinct = {};
    print " x | " . join( " ", ( 1 .. $n ) ) . "\n";
    print "---+-" . "-" x ( $n * 2 - 1 ) . "\n";
    for my $i ( 1 .. $m ) {
        print " $i | " . join( " ", map { $i * $_ } ( 1 .. $n ) ) . "\n";
        for my $j ( 1 .. $n ) {
            $distinct->{ $i * $j } = undef;
        }
    }
    return $distinct;
}
MAIN: {
    my $distinct = compute_print( 3, 3 );
    print "Distinct Terms: "
      . join( ", ", sort { $a <=> $b } keys %{$distinct} ) . "\n";
    print "Count: " . keys( %{$distinct} ) . "\n";
    print "\n\n";
    $distinct = compute_print( 5, 5 );
    print "Distinct Terms: "
      . join( ", ", sort { $a <=> $b } keys %{$distinct} ) . "\n";
    print "Count: " . keys( %{$distinct} ) . "\n";
}
