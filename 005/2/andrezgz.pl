#!/usr/bin/env perl
use v5.36;

my $words_file = 'words';

open(my $fh, "<", $words_file) or die "Could not open words file '$words_file': $!";

my %anagrams;
my %candidates;
my $max_anagrams = 0;

while( my $word = <$fh> ) {
    chomp $word; #remove new line trailing string

    my $k = join( '', sort split //, lc $word); #identifier for words with same letters
    push @{$anagrams{$k}}, $word;

    my $k_anagrams = @{$anagrams{$k}};
    next if ($k_anagrams < $max_anagrams);                          # not a candidate right now
    $candidates{$k} = 1;                                            # it's a candidate
    $max_anagrams = $k_anagrams if ( $k_anagrams > $max_anagrams ); # the best candidate at the moment

}
close $fh;

print "Sequence of characters with the most anagrams ($max_anagrams)".$/;

#Check only candidates to avoid looping over the complete %anagrams hash
foreach my $k (keys %candidates) {
    next if @{$anagrams{$k}} != $max_anagrams;
    print join( ',', split //, $k)
        . " => "
        . join(",", sort {lc($a) cmp lc($b)} @{$anagrams{$k}}) . $/;
}
