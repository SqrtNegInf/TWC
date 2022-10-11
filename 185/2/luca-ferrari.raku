#!/usr/bin/env raku

sub MAIN( @codes = ('ab-cde-123', '123.abc.420', '3abc-0010.xy') ) {
    my @output-codes;
    for @codes -> $current-code {
        my @current-output;
        my $counter = 4;
        for $current-code.comb -> $current-char is copy {
            $current-char = 'x' and $counter-- if $current-char ~~ / <[0..9a..z]> / && $counter > 0;
            @current-output.push: $current-char;
        }

        @output-codes.push: @current-output.join;
    }

    @output-codes.join( "\n" ).say;
}
