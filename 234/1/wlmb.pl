#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);

my @A = ("java", "javascript", "julia");

die <<~"FIN" unless @A;
    Usage: $0 W1 [W2...]
    to find the common characters in all words W1, W2...
    FIN
my @letters_of_word;
for(@A){
    my %count_of_letter;
    $count_of_letter{$_}++ for split "";
    push @letters_of_word, \%count_of_letter;
}
my $number_of_words=@letters_of_word;
my @result=map {
    my $letter=$_;
    my $repetition=min map {
	my $word_number=$_;
	$letters_of_word[$word_number]{$letter}//0
    } 0..$number_of_words-1;
    ($letter) x $repetition;
} sort keys %{$letters_of_word[0]};
say "@A -> @result";
