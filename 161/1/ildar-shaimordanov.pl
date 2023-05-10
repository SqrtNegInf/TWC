#!/usr/bin/env perl
use v5.36;

# The same approach as one-liner
# perl -nle 'BEGIN { $A = join "", "a".."z" } $a = $A; ( $w = $_ ) =~ s/(.)\1*/$a =~ s#.*$1## ? "" : $&/eg; $w or print'

my $A = join "", "a".."z";

open my $fh, '<', 'words';
while ( <$fh> ) {
	my $a = $A;

	chomp( my $word = $_ );

	$word =~ s/(.)\1*/ $a =~ s|.*$1|| ? "" : $& /eg;

	$word or print;
}
