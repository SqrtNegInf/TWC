#!/usr/bin/env perl

use strict;
use warnings;
use feature qw / say /;
use Test::More;

my ( $operation, $keyword, $in_text ) = ( $ARGV[0], $ARGV[1], $ARGV[2] );
my $out_text;
my %operations = (
    '-e' => 'encrypted',
    '-d' => 'decrypted',
);

ok( encode( "ATTACKATDAWN", "LEMON" ) eq "LXFOPVEFRNHR", "encode working" );
ok( decode( "LXFOPVEFRNHR", "LEMON" ) eq "ATTACKATDAWN", "decode working" );
done_testing();

sub encode {
    my ( $plaintext, $keyword ) = @_;
    my $cyphertext;
    for my $i ( 0 .. ( ( length $plaintext ) - 1 ) ) {
        my $mi = ord( substr( $plaintext, $i, 1 ) ) - 65;
        my $ki = ord( substr( $keyword, ( $i % length $keyword ), 1 ) ) - 65;
        $cyphertext .= chr( ( ( $mi + $ki ) % 26 ) + 65 );
    }
    return $cyphertext;
}

sub decode {
    my ( $cyphertext, $keyword ) = @_;
    my $plaintext;
    for my $i ( 0 .. ( ( length $cyphertext ) - 1 ) ) {
        my $ci = ord( substr( $cyphertext, $i, 1 ) ) - 65;
        my $ki = ord( substr( $keyword, ( $i % length $keyword ), 1 ) ) - 65;
        $plaintext .= chr( ( ( $ci - $ki ) % 26 ) + 65 );
    }
    return $plaintext;
}
