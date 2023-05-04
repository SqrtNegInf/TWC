#!/usr/bin/env perl
use v5.36;

my ($input, $sentence, @words, $line_length, $word, $paragraph);

$input = q[All he could think about was how it would all end. There was
    still a bit of uncertainty in the equation, but the basics
    were there for anyone to see. No matter how much he tried to
    see the positive, it wasn't anywhere to be seen. The end was
    coming and it wasn't going to be pretty.];
	
# loop over sentences
$line_length = 0;
while ($input =~ m|(.+?)\.|gs) {
	$sentence = $1;
	
	# extract words in next sentence and sort them
	@words = ();
	while ($sentence =~ m|([a-z']+)|gi) {
		push(@words, $1);
	}
	@words = sort {lc($a) cmp lc($b)} @words;
	
	# output the words with line breaks to keep lines under 60 characters
	for $word (@words) {
		if ($line_length + length($word) > 59) {
			$paragraph .= qq[\n];
			$line_length = 0;
		}			
		$paragraph .= $word . ' ';
		$line_length += length($word) + 1;
	}
	$paragraph =~ s| $|. |;
}

# and print the result
say $paragraph;
	
