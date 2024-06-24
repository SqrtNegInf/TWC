#!/usr/bin/env raku

sub MAIN( Str $sentence = "Perl and Raku are friends") {
# 1) If a word begins with a vowel ("a", "e", "i", "o", "u"), append
#    "ma" to the end of the word.
# 2) If a word begins with consonant i.e. not a vowel, remove first
#    letter and append it to the end then add "ma".
# 3) Add letter "a" to the end of first word in the sentence, "aa" to
    #    the second word, etc etc.

    my $suffix = 'a';
    my @words;
    for $sentence.split( / \s+ / ) -> $word is copy {
	$word ~~ / ^ ( <[a..zA..Z]> ) .* $ /;
	my $initial = $/[ 0 ].Str;
	if ( $initial.lc !~~ / <[aeiou]> / ) {
	    $word = $word.comb[ 1 .. * ].join ~ $initial;
	}

	$word ~= 'ma';
	$word ~= $suffix;
	$suffix ~= 'a';
	@words.push: $word;
    }

    @words.join( ' ' ).say;

}
