#!/usr/bin/env raku

my $sentence = 'Perl Weekly Challenge';
my @keys = ('l');
my @ok-words;

    for $sentence.lc.split( / \s+ / ) -> $word {
	my $ok = True;

	for @keys -> $needle {
	    $ok = False if ( $word ~~ / $needle / );
	    last if ! $ok;
	}

	@ok-words.push: $word if $ok;
    }

    @ok-words.elems.say;
