#!/usr/bin/env perl
use v5.36;

my ($max_col,$text) = @ARGV;
$max_col  ||= 45;
$text     ||= "Hello world, it's a very nice day! The sun is shining. Rainbows and Unicorns!";

my @word = split(/ /,$text);
my %word = map { $_ => length($_) } @word;

my $line = "";
my $c = 0;
foreach my $w (@word) {
	if (($c + $word{$w}) <= $max_col) {
		$c += $word{$w}+1;
		$line .= "$w ";
	} else {
		say $line;
		$line = "$w "; 
		$c = $word{$w};
	}
}
say $line if ($line);

__END__

./ch2.pl 15 "Hello world, it's a very nice day! The sun is shining. Rainbows and Unicorns!"
Hello world,
it's a very nice
day! The sun is
shining.
Rainbows and
Unicorns!

./ch2.pl 45 "Hello world, it's a very nice day! The sun is shining. Rainbows and Unicorns!"
Hello world, it's a very nice day! The sun is
shining. Rainbows and Unicorns!

./ch2.pl 75 "Hello world, it's a very nice day! The sun is shining. Rainbows and Unicorns!"
Hello world, it's a very nice day! The sun is shining. Rainbows and
Unicorns!
