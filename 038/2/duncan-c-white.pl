#!/usr/bin/env perl
use v5.36;

srand 1;

my %tilebag = (
	A => 8, G => 3, I => 5, S => 7,
	U => 5, X => 2, Z => 5, E => 9,
	J => 3, L => 3, R => 3, V => 3,
	Y => 5, F => 3, D => 3, P => 5,
	W => 5, B => 5, N => 4, T => 5,
	O => 3, H => 3, M => 4, C => 4,
	K => 2, Q => 2,
);


my $debug=0;

#srand(1);

# build alltiles, a weighted list of tiles to take at random
my $alltiles= join( '', map { $_ x $tilebag{$_} } sort keys %tilebag );
#print "alltiles $alltiles\n";


my %value = (
	# 1 point:
	A => 1, G => 1, I => 1, S => 1, U => 1, X => 1, Z => 1,

	# 2 points:
	E => 2, J => 2, L => 2, R => 2, V => 2, Y => 2,

	# 3 points:
	F => 3, D => 3, P => 3, W => 3,

	# 4 points:
	B => 4, N => 4,

	# 5 points:
	T => 5, O => 5, H => 5, M => 5, C => 5,

	# 10 points:
	K => 10, Q => 10,
);

#die Dumper \%value;


#
# my $hand = randomtiles( $n );
#	Select $n random tiles from $alltiles.  Return
#	an $n-letter sorted sequence of those random tiles.
#
sub randomtiles( $n )
{
	my $at = $alltiles;
	my @result;
	foreach my $i (1..$n)
	{
		my $pos = int(rand(length($at)));
		push @result, substr( $at, $pos, 1 );
		substr( $at, $pos, 1 ) = '';
	}
	return join( '', sort @result );
}


#
# my @words = readdict( $filename );
#	Read the given wordlist $filename.  Return the list of words.
#
sub readdict( $filename )
{
	open( my $fh, '<', $filename ) || die;
	my @result;
	while( <$fh> )
	{
		chomp;
		next unless /^[A-Za-z]+$/;
		$_ =~ tr/a-z/A-Z/;
		push @result, $_;
	}
	close( $fh );
	return @result;
}


#
# my $score = score( $word );
#	Score the letters of $word using the %value. Return the score.
#
sub score( $word )
{
	my $score = 0;
	foreach my $letter (split(//,$word))
	{
		$score += $value{$letter};
	}
	return $score;
}


my @words = grep { length($_)<8 } readdict( 'words' );
my %isword = map { $_ => 1 } @words;
#die Dumper \%isword;

# find highest scoring word that is a sub-bag of $hand.
my $highscore=0;
my $highscore_word;


#
# findall( $prefix, $hand );
#	Find all sub-words of $hand (starting with $prefix)
#	that are dictionary words, score each one, and find
#	the highest scored word.
#
sub findall( $prefix, $hand )
{
	#say "debug: prefix=$prefix, hand=$hand";
	my $l = length($hand);
	foreach my $pos (0..$l-1)
	{
		my $letter = substr($hand,$pos,1);
		my $w = $prefix.$letter;
		if( $isword{$w} )
		{
			my $score = score( $w );
			#say "debug: w=$w, score=$score";
			if( $score > $highscore )
			{
				$highscore = $score;
				$highscore_word = $w;
			}
		}
		my $rest = $hand;
		substr($rest,$pos,1) = '';
		findall( $w, $rest );
	}
}


die "Usage: ch-2.pl [NROUNDS]\n" if @ARGV>1;
my $nrounds = shift // 1;

my $overall_highscore=0;
my $overall_highscore_word;
my $overall_highscore_hand;
foreach (1..$nrounds)
{
	$highscore=0;
	my $hand = randomtiles( 7 );
	#my $score = score( $hand );
	findall( "", $hand );
	say "hand:$hand, highscore:$highscore, word:$highscore_word" if $debug;
	if( $highscore > $overall_highscore )
	{
		$overall_highscore = $highscore;
		$overall_highscore_word = $highscore_word;
		$overall_highscore_hand = $hand;
	}
}
say "overall: hand:$overall_highscore_hand, highscore:$overall_highscore, word:$overall_highscore_word";
