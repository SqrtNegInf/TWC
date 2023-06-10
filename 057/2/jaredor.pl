#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniq);

sub get_abvmap {
    my ( @strings, %abbv ) = @_;
    push @{ $abbv{ substr( $_, 0, 1, '' ) } }, $_ for @strings;
    for my $mult ( grep { $#{ $abbv{$_} } } keys %abbv ) {
        my %mult_abbv = get_abvmap( @{ delete $abbv{$mult} } );
        $abbv{ $mult . $_ } = [ $mult_abbv{$_} ] for keys %mult_abbv;
    }
    $abbv{$_} = $abbv{$_}->[0] for keys %abbv;
    return %abbv;
}

my @ARGV = ( "alphabet", "book", "carpet", "cadmium", "cadeau", "alpine" );
my %abvmap = get_abvmap( uniq @ARGV );
my %abbrev = map { ( $_ . $abvmap{$_}, $_ ) } keys %abvmap;
print join( ' ', @abbrev{@ARGV} ), "\n";
