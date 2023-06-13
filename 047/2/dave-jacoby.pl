#!/usr/bin/env perl
use v5.36;

my @x;
my $n = 100;
while ( scalar @x < 20 ) {
	my @n = split //, $n;
	my $i = join '', $n[0], $n[-1];
	push @x, $n if $n % $i == 0;
	$n++;
}
say join "\n", @x;

say '-' x 30;

# When I'm trying to show off a little more
#   I use a for loop ending at an abstractly large point
#   I name the for loop
#   I use state so the count variable only exists within the loop
#   I use the named last to break the loop

LOOP: for my $n ( 100 .. 1000 ) {
	state $c = 0;
	my @n = split //, $n;
	my $i = join '', $n[0], $n[-1];
	if ( 0 == $n % $i ) {
		$c++;
		say $n;
	}
	last LOOP if $c >= 20;
}

say '-' x 30;

# When I'm trying to be way-cool functional dev
#   I start with a range of 100..1000
#   I use join to stringify the output
#   I use a grep and a state variable to limit to 20
#   I use substr to pull the first and last digit from the number
#     and only create one variable in the second grep

say join "\n", grep { state $c = 0; $c++ < 20 }
	grep { my $i = join '', substr( $_, 0, 1 ), substr( $_, -1 ); $_ % $i == 0 }100 .. 1000;

say '-' x 30;

my $next = make_iterator(100);

while ( my $n = $next->() ) {
	state $c = 0;
	my $i = join '', substr( $n, 0, 1 ), substr( $n, -1 );
	if ( 0==$n%$i){
		say $n;
		$c++;
	}
	last if $c >19;
}

sub make_iterator ( $start ) {
	return sub {
		state $i = $start;
		return $i++;
		}
}

# the right answers:
# 100, 105, 108, 110, 120,
# 121, 130, 132, 135, 140,
# 143, 150, 154, 160, 165,
# 170, 176, 180, 187, 190

