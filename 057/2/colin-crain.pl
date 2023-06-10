#!/usr/bin/env perl
use v5.36;

my @input = ("alphabet", "book", "carpet", "cadmium", "cadeau", "alpine", "court", "courtship") ;

my $trie = {};

## build the trie structure
for my $word ( @input ) {
    my $node = $trie;                   ## reset to root

    for my $letter ( split //, $word ) {
        ## if a node for the char exists, up the count, if not create it with count 1
        if (exists $node->{$letter} ) {
            $node->{$letter}->{count}++;
        }
        else {
            $node->{$letter} = {  link  => {},
                                  count => 1   } ;
        }
        ## reassign the base node to a reference to the new letter node and repeat
        $node = $node->{$letter}->{link};
    }
}

my %output;

## walk down the trie until count == 1 -- this is the shortest unique prefix
for my $word ( @input ) {
    my $node = $trie;                   ## reset to root
    my $sup;

    for my $letter ( split //, $word ) {
        $sup .= $letter;
        ## if the count drops to 1 this word is the only one to have walked this path,
        last if $node->{$letter}->{count} == 1;
        $node = $node->{$letter}->{link};
    }
    $output{$word} = $sup;
}

## output
printf "%-10s => %-10s \n", $_, $output{$_} for (sort keys %output) ;
