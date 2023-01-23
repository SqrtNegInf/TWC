#!/usr/bin/env raku

#
# Perl Weekly Challenge 200
# Task 2
#
# See <https://perlweeklychallenge.org/blog/perl-weekly-challenge-200/>
#

sub MAIN( Int $value = 200, Bool :$sign = False ) {

    my @sign = [
	[ '          ',
	  '          ',
	  '          ',
	  '   -----  ',
	  '          ',
	  '          ',
	  '          ',
	],
	[ '          ',
	  '          ',
	  '     |    ',
	  '   -----  ',
	  '     |    ',
	  '          ',
	  '          ',
	],
    ];

    my @lcd = [
	[ ' -------- ',
	  '|        |',
	  '|        |',
	  '|        |',
	  '|        |',
	  '|        |',
	  ' -------- ',
	],
	[ '         ',
	  '        |',
	  '        |',
	  '        |',
	  '        |',
	  '        |',
	  '         ',
	],
	[ ' ------ ',
	  '       |',
	  '       |',
	  ' ------ ',
	  '|       ',
	  '|       ',
	  ' ------ ',
	],

	[ ' ------ ',
	  '       |',
	  '       |',
	  ' ------ ',
	  '       |',
	  '       |',
	  ' ------ ',
	],

	[ '|      |',
	  '|      |',
	  '|      |',
	  ' ------ ',
	  '       |',
	  '       |',
	  '        ',
	],
	[ ' ------ ',
	  '|       ',
	  '|       ',
	  ' ------ ',
	  '       |',
	  '       |',
	  '        ',
	],
	[ ' ------ ',
	  '|       ',
	  '|       ',
	  ' ------ ',
	  '|      |',
	  '|      |',
	  ' ------ ',
	],

	[ ' -------',
	  '       |',
	  '       |',
	  '       | ',
	  '       |',
	  '       |',
	  '        ',
	],

	[ ' -------- ',
	  '|        |',
	  '|        |',
	  ' -------  ',
	  '|        |',
	  '|        |',
	  ' -------- ',
	],

	[ ' -------- ',
	  '|        |',
	  '|        |',
	  ' -------  ',
	  '         |',
	  '         |',
	  ' -------- ',
	],


    ];

    my @display;
    @display.push: @sign[ $value > 0 ?? 1 !! 0 ] if ( $value < 0 || $sign );
    @display.push: |@lcd[ $value.comb ];
    ( [Z] |@display ).join( "\n" ).say;
}
