#!/usr/bin/env raku

sub MAIN( Str $file-name = 'input.txt',
          Int $A = 3,
          Int $B = 6 ) {
    my $line-counter = 0;
    for $file-name.IO.lines -> $line {
        $line.say if ( $A <= ++$line-counter <= $B );
    }

    # array with lazy approach
    # my @lines = $file-name.IO.lines;
    # @lines[ $A .. $B ].join( "\n" ).say;

}
