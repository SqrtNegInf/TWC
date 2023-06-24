#!/usr/bin/env perl
use v5.36;

sub sortedlc { join '', sort { $a cmp $b } split '', lc $_[0] }

open my $fh, '<:encoding(UTF-8)', 'words';
chomp( my @dict = <$fh> );

my %signatures;
$signatures{ sortedlc( $_ ) }++ for @dict;
my %by_count = reverse %signatures;

my $max = ( sort { $b <=> $a } keys %by_count )[0];
my $word = $by_count{$max};
my $wordlength = length $word;

sub is_anagram {
    my ( $dictword ) = @_;
    return 0 if length $dictword != $wordlength;
    $word eq sortedlc $dictword;
}

print "(A) longest anagram set from '$word':\n";
print "$_\n" for grep { is_anagram( $_ ) } @dict;
