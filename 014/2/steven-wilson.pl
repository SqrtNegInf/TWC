#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw(uniq);

my %states = (
    AK => 1,
    AL => 1,
    AR => 1,
    AZ => 1,
    CA => 1,
    CO => 1,
    CT => 1,
    DE => 1,
    FL => 1,
    GA => 1,
    HI => 1,
    IA => 1,
    ID => 1,
    IL => 1,
    IN => 1,
    KS => 1,
    KY => 1,
    LA => 1,
    MA => 1,
    MD => 1,
    ME => 1,
    MI => 1,
    MN => 1,
    MO => 1,
    MS => 1,
    MT => 1,
    NC => 1,
    ND => 1,
    NE => 1,
    NH => 1,
    NJ => 1,
    NM => 1,
    NV => 1,
    NY => 1,
    OH => 1,
    OK => 1,
    OR => 1,
    PA => 1,
    RI => 1,
    SC => 1,
    SD => 1,
    TN => 1,
    TX => 1,
    UT => 1,
    VA => 1,
    VT => 1,
    WA => 1,
    WI => 1,
    WV => 1,
    WY => 1,
);
my @found_words;
my @sorted_found_words;

open my $fh, '<', '/usr/share/dict/words';

while ( my $word = <$fh> ) {
    chomp $word;
    $word = uc $word;
    if ( length $word < 4 || ( ( length $word ) % 2 ) != 0 ) {
        next;
    }
    else {
        my @pairs = ( $word =~ m/../g );
        my $found = grep { !exists $states{$_} } @pairs;
        if ( !$found ) {
            push @found_words, $word;
        }
    }
}

close $fh;

@sorted_found_words = sort { length $a <=> length $b } uniq sort @found_words;

say "Found the words:";
for (@sorted_found_words) {
    print "$_, ";
}
print "\n";
