#!/usr/bin/env perl
use v5.36;

my $word = sortedlc( 'animal' );
my $wordlength = length $word;

sub sortedlc { join '', sort { $a cmp $b } split '', lc $_[0] }

sub is_anagram {
    my ( $dictword ) = @_;
    return 0 if length $dictword != $wordlength;
    $word eq sortedlc $dictword;
}

open my $fh, '<:encoding(UTF-8)', 'words';
chomp( my @dict = <$fh> );
print "$_\n" for grep { is_anagram( $_ ) } @dict;
