#!/usr/bin/env perl
use v5.36;

sub common_substr_find {	
	my @str = @_;
	# The plan is to chunk our strings from largest to smallest
	# for example: hello,hell,ello,hel,ell,llo,he,el,ll,lo,h,e,l,l,o
	# Then use the chunks as hash keys to count occurances.
	# We stop looking at smaller chunks if a bigger match is found.

	my $out = "";
	my %count;
	my %chunk;
	my $longest_match = 0;
	foreach my $str (@str) {
		my $i = 0;
		my $len = length($str);
		my $offset = $len;
		while ($offset > 0) {
			while (($i + $offset) <= $len and ($i + $offset) >= $longest_match) {
				my $chunk = substr($str,$i,$offset);
				unless (defined $chunk{$str}{$chunk}) {
					# don't match chunks within the same str
					$chunk{$str}{$chunk} = 1;
					$count{$chunk}++; 
				}
				$longest_match = length($chunk) if ($count{$chunk} > 1 and length($chunk) > $longest_match);
				$i++;
			}
			$i = 0;
			$offset--;
		}
	}

	foreach (sort keys %count) {
		if ($count{$_} > 1) {
			$out .= "$_\n" if (length($_) == $longest_match);
		}
	}

	say "strings are: " . join(",",@str);
	if ($out) {
		$out = "longest matching substrings are:\n" . $out;
	} else {
		$out = "no substrings match\n";
	}
	say $out;
}

if (@ARGV) {
	common_substr_find(@ARGV);
	exit;
}

my %testdata = (
	1 => "hello world", 
	2 => "polar bears love snow", 
	3 => "goodbye goodyear goody",
	4 => "abc xzy",
	5 => "duane powell xxxxduanexxxpowellxxx",
	6 => "abba bbaa aaaa bbbb baba abab",
	#7 => "ALL ENGLISH WORDS ... words.txt",
);

foreach my $data (sort(keys %testdata)) {
	my @str;
	if ($data < 7) {
		@str = split(" ",$testdata{$data});
		common_substr_find(@str);
	} else {
		open(my $fh, "<", "words.txt") or die "Can't open < words.txt: $!";
		while (my $word = <$fh>) {
			chomp $word;
			push @str, $word;
		}
		common_substr_find(@str);
	}
}
