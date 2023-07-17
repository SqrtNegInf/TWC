#!/usr/bin/env perl
use v5.36;

sub max_sentence_length{
    my(@sentences) = @_;
    my $max_words = -1;
    do{
        my @word_matches = $_ =~ m/(\w+)/g; 
        $max_words = @word_matches if @word_matches > $max_words;
    } for @sentences;
    return $max_words;
}

MAIN:{
    my @list;
    @list = ("Perl and Raku belong to the same family.", "I love Perl.", 
"The Perl and Raku Conference.");
    say  max_sentence_length(@list);
    @list = ("The Weekly Challenge.", "Python is the most popular guest language.",
"Team PWC has over 300 members.");
    say  max_sentence_length(@list);
}
