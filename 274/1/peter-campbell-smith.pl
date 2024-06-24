#!/usr/bin/env perl
use v5.36;

goat_latin("I love Perl");
goat_latin("Perl and Raku are friends");
goat_latin("The Weekly Challenge");
goat_latin(qq[Can't you say 'Hello!' to my mother-in-law?]);

sub goat_latin {
	
	my ($sentence, $append, $word, $pre, $post, $goated);
	
	$sentence = shift;
	$append = '';
	
	# split sentence into words and punctuation
	while ($sentence =~ m|([^\s]+)(\s*)|g) {
		$word = $1;
		$word =~ m|^([^\w]*)([\w'\-]+)([^\w]*)$|;
		($pre, $word, $post) = ($1, $2, $3);
		if ($word =~ m|'$|) {
			$word = substr($word, 0, -1);
			$post = qq['$post];
		}
			
		# apply the rules
		$word = substr($word, 1) . substr($word, 0, 1)
			unless $word =~ m|^[aeiou]|i;	
		$append .= 'a';
		
		# join it all up
		$goated .= $pre . $word . 'ma' . $append . $post . ' ';
	}
	
	printf(qq[\nInput:  \$sentence = "%s"\n], $sentence);
	printf(qq[Output: "%s"\n], substr($goated, 0, -1));
}
