#!/usr/bin/env perl
use v5.36;

my $file = 'words';
die "ERROR: Missing dictionary.\n"         unless defined $file;
die "ERROR: Invalid dictionary [$file].\n" unless -f -r -e $file;

open (my $DICT, "<", $file);
my $words = {};
while (my $word = <$DICT>) {
    chomp $word;
    my $len = length($word);
    $words->{$word} = $len if $len >= 2 && is_abecedarian($word);
}
close $DICT;

printf("%s\n", join("\n", sort { $words->{$b} <=> $words->{$a} } sort keys %$words));

#
#
# METHOD

sub is_abecedarian {
    my ($word) = @_;

    return 0 unless defined $word;
    $word = lc $word;
    return $word eq (join q{}, sort split //,$word);
}
