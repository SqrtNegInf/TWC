#!/usr/bin/env perl
use v5.36;

{
    my ( $FILE, @numbers ) = <input.txt 4 5>;
    say readN( $FILE, $_ ) for @numbers;
}

sub readN ( $file, $chars ) {
    state $filehandles = {};

    my $fh;
    if ( $filehandles->{$file} ) {
        $fh = $filehandles->{$file};
    }
    else {
        open( $fh, '<', $file );
        $fh->binmode( ':utf8' );
        $filehandles->{$file} = $fh;
    }

    my $out;
    while ( $chars-- && !$fh->eof ) {
        $out .= $fh->getc;
    }

    return $out;
}
