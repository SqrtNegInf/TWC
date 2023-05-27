#!/usr/bin/env perl
use v5.36;

use List::AllUtils qw(zip_by all);

sub isSorted($word) {
    my @word = split //, lc $word;
    my @wordl=@word[0..(length $word)-2];
    my @wordr=@word[1..(length $word)-1];
    my @diffs = zip_by {ord($_[1]) - ord($_[0])} \@wordl, \@wordr;
    return ((lc $word) =~ /^[a-z]+$/) && (all {$_ >= 0} @diffs);
}

sub longestWith($list,$pred) {
    my $length=0;
    my @res=();
    for (@$list) {
	my $l=length($_);
	next if (! &$pred($_));
        $l > $length && do {
	    $length = $l;
	    @res=($_,);
	    next;
	};
	$l == $length && push @res, $_;
    }
    return \@res;
}

my @words;
open(my $fh, '<', '/usr/share/dict/words');
while (<$fh>) {
    chomp;
    push @words, $_;
}

my @res=@{longestWith(\@words,\&isSorted)};
for (@res) {say};
