#!/usr/bin/env raku

sub MAIN( Str $file-name = 'example.csv' ) {

    my @content;
    @content.push: .split( ',' ) for $file-name.IO.lines;

    # for 0 ..^ @content[ 0 ].elems -> $column {
    #     my @row.push:  @content[ $_ ][ $column ] for 0 ..^ @content.elems;
    #     @row.join( ',' ).say;
    # }

    my @transposed.push: @content.map: *[ $_ ] for 0 ..^ @content[ 0 ].elems;
    $_.join( ',' ).say for @transposed;

}
