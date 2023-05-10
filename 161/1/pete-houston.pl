#!/usr/bin/env perl
use v5.36;

my @abc = get_abecedarians ();
@abc = sort { length ($b) <=> length ($a) || $a cmp $b } @abc;
print "$_\n" for @abc;

sub get_abecedarians {
	my $dict = 'words';
	open my $in, '<', $dict or die "Cannot open $dict for reading: $!";

	my @abc;
	while (my $str = <$in>) {
		chomp $str;
		push @abc, $str if is_abecedarian ($str);
	}
	close $in;
	return @abc;
}

sub is_abecedarian {
	my $word = shift;

	# Alpha-ordering should be case-insensitive
	$word = fc $word;
	my $lastchr = substr ($word, 0, 1);
	for my $pos (1 .. length $word) {
		my $chr = substr ($word, $pos, 1);
		next unless $chr =~ /[[:alpha:]]/; # Expensive, but finite set
		return 0 if 1 == ($lastchr cmp $chr);
		$lastchr = $chr;
	}
	return 1;
}
