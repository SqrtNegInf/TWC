#!/usr/bin/env perl
use v5.36;

srand 1;

use constant {
        L_PAREN => '(',
        R_PAREN => ')',
};

# generate between 1 and 7 parens, if paren string not passed from cmd line 
my $paren = shift;
if ($paren) {
	say "Given paren string = $paren";
} 
else {
	my $lower_limit = 2;
	my $upper_limit = 7;
	my $random_number = int(rand($upper_limit-$lower_limit)) + $lower_limit;
	for (1 .. $random_number) {
		# coin toss left or right paren
		$paren .= (rand() < 0.5) ? L_PAREN : R_PAREN;
	}
	say "Random paren string = $paren";
}

# test if parens are balanced
my $msg;
my $paren_count = 0;
foreach (split(//,$paren)) {
	$paren_count-- if ($_ eq R_PAREN);
	$paren_count++ if ($_ eq L_PAREN);
	if ($paren_count < 0) { 
		$msg = "Parens are not balanced.";
		last;
	}
}
$msg = 'Parens are balanced.'   if ($paren_count == 0);
$msg = 'Parens are not closed.' if ($paren_count  > 0);
say $msg;

__END__

./ch-2.pl
random paren string = ()
Parens are balanced.

./ch-2.pl "((())())"
Given paren string = ((())())
Parens are balanced.

./ch-2.pl ")(()()(((()))))"
Given paren string = )(()()(((()))))
Parens are not balanced.

./ch-2.pl "((())"
Given paren string = ((())
Parens are not closed.

