#!/usr/bin/env perl
use v5.36;

use open qw( :encoding(utf-8) :std );

my $len = 20;
my $file = './unicode-text-test.txt';

open( my $fh, '<', $file ) or die "no such file $file : $!";

say readN($fh, 20);
say readN($fh, 20);
say readN($fh, 20);

sub readN {
    no warnings qw( uninitialized );
    my ($fh, $length, $offset) = @_;
    my $buffer;
    read( $fh, $buffer, $length, $offset );
    return $buffer;
}

