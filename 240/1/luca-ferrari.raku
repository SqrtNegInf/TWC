#!/usr/bin/env raku

sub MAIN( $check-string = 'ppp', @strings = ("Perl", "Python", "Pascal") ) {
    # the check string must contain the same
    # exact number of chars of the number of strings
    'False'.say and exit if ( $check-string.comb.elems != @strings.elems );

    # # check all the letters
    # my @letters = $check-string.comb;
    # for 0 ..^ @strings.elems {
    # 	'False'.say and exit if ( @letters[ $_ ].fc ne ( @strings[ $_ ].comb )[ 0 ].fc );
    # }


    my @check-letters = $check-string.comb.map( *.fc );
    my @letters = @strings.map( ( *.comb )[ 0 ].fc );
    'True'.say and exit if ( @letters ~~ @check-letters );

    'False'.say;
}
