#!/usr/bin/env perl
use v5.36;

use Math::Big ();
use Math::BigFloat ();
use Math::NumberCruncher ();
#use Math::Symbolic ();
use Math::AnyNum ();
use Sidef ();
use Text::Table::Tiny ();
use bigrat;

my @eulers = (
    [ 'Math::Big::euler',              sub { Math::Big::euler(1, 47) } ],
    [ 'Math::NumberCruncher::ECONST',  sub { Math::NumberCruncher::ECONST( 46 ) } ],
    [ 'Math::NumberCruncher::_e_',     sub { substr( $Math::NumberCruncher::_e_, 0, 48 ) . '...' } ],
#    [ 'Math::Symbolic::EULER',         sub { Math::Symbolic::EULER } ],  # problem with 'strict subs'
    [ 'Math::AnyNum::euler',           sub { Math::AnyNum->e } ],
   [ 'Sidef Number.e',                sub { Sidef->new()->execute_code("Number.e()") } ],
    [ 'bigrat::e',                     sub { require bigrat; bigrat::e() } ],
    # My calculated version of e starts to differ around the 35th decimal.
    [ 'Calculated e',                  sub { substr( e(), 0, 48 ) . '...'  } ],
);

my @table = [ 'Module', q{Euler's Number} ];
foreach my $euler ( @eulers ) {
    push @table, [ $euler->[0], $euler->[1]->() ];
}

say Text::Table::Tiny::generate_table( header_row => 1, rows => \@table );

sub e {
    my $e = Math::BigFloat->bzero;
    for my $n ( 0 .. 50 ) {
        $e += Math::BigFloat->bone / Math::BigFloat->new( factorial( $n ) );
    }
    return $e;
}


sub factorial {
    my $n = shift;
    return 1 if $n == 0;
    return $n * factorial( $n - 1 );
}

