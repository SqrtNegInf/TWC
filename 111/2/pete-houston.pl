#!/usr/bin/env perl
use v5.36;

#use feature 'fc';

my $dict    = shift // '/usr/share/dict/words';
my $enc_in  = shift // 'us-ascii';
my $enc_out = shift // $enc_in;
my $length  = 0;
my @longest;

open my $wordsfh, "<:encoding($enc_in)", $dict or
	die "Dictionary $dict not accessible: $!";

# $length and $wlen include the EoL char(s). We only use these vars for
# comparison, so this is fine and more efficient.
while (my $word = <$wordsfh>) {
	my $wlen = length $word;
	next if $length > $wlen;
	chomp $word;
	next unless is_sorted ($word);
	if ($length < $wlen) {
		$length = $wlen;
		@longest = ($word);
	} else {
		push @longest, $word;
	}
}

binmode STDOUT, ":encoding($enc_out)";
say join "\n", @longest;

sub is_sorted {
	my @chars = split //, fc shift;
	for my $i (0 .. $#chars - 1) {
		return if 1 == ($chars[$i] cmp $chars[$i + 1]);
	}
	return 1;
}
