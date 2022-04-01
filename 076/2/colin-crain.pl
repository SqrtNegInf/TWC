#!/usr/bin/env perl

use warnings;
use strict;
use feature ":5.26";

## ## ## ## ## MAIN:

my $file     = shift @ARGV // 'grid.txt';
my $dict     = shift @ARGV // 'words.txt';
my $MINWORD  = shift @ARGV // 5;

my $matrix = load_search_matrix($file);
print_matrix($matrix);

my $words = build_word_hash($dict);

my @possibles; 

my $height = @$matrix - 1;
my $width  = $matrix->[0]->@* - 1 ;

for my $y (0..$height) {
    for my $x (0..$width) {
        push @possibles,  word_vectors( $x, $y, $matrix)->@*;
    }
}

my @output = grep { exists $words->{$_} } @possibles;
say '';
say "found ", scalar @output, " words of minimum length $MINWORD: \n";
say for sort @output;

## ## ## ## ## SUBS:

sub word_vectors {
    my ($x, $y, $matrix) = @_;
    my $height = @$matrix - 1;
    my $width  = $matrix->[0]->@* - 1 ;
    my @words;
    my @vec ;
    my $i;
    
    ## horz forward
    push $vec[0]->@*, $matrix->[$y][$_] for ($x..$width);
    
    ## horz back
    push $vec[1]->@*, $matrix->[$y][$_] for reverse (0..$x);
    
    ## vert down
    push $vec[2]->@*, $matrix->[$_][$x] for ($y..$height);
    
    ## vert up
    push $vec[3]->@*, $matrix->[$_][$x] for reverse (0..$y);

    ## diag down forward
    $i = $x;
    for ($y..$height) {         ## y to height index
        last if $i > $width;
        push $vec[4]->@*, $matrix->[$_][$i++];
    } 

    ## diag down back
    $i = $x;
    for ($y..$height) {         ## y to height index
        last if $i < 0;
        push $vec[5]->@*, $matrix->[$_][$i--];
    }
 
    ## diag up forward
    $i = $x;
    for (reverse (0..$y)) {         ## 0 to y 
        last if $i > $width;
        push $vec[6]->@*, $matrix->[$_][$i++];
    }

    ## diag up back
    $i = $x;
    for (reverse (0..$y)) {         ## 0 to y 
        last if $i < 0;
        push $vec[7]->@*, $matrix->[$_][$i--];
    }

    ## turn vectors into strings $MINWORD letters or longer
    for my $v (@vec) {
        next if @$v < $MINWORD;
        my $stem = join '', @$v[0..$MINWORD-2];
        push @words, map { $stem .= $_ } @$v[$MINWORD-1..@$v-1];
    }

    return \@words;
}

sub load_search_matrix {
    my $file = shift;
    open my $fh, '<', $file 
        or die "cannot open file $file: $!\n";
    my @search;
    
    while (my $line = <$fh>) {
        push @search, [split /\s/, $line];    
    }
    close $fh;
    return \@search;
}

sub print_matrix {
    my $matrix = shift;
    for (@$matrix) {
        say join ' ', @$_;
    }
}

sub build_word_hash {
    my $dict = shift;
    my %hash;
    open my $fh, "<",  $dict
        or die "can't open $dict to read: $!";
        
    while (my $word = <$fh>) {
        $word =~ s/[\n\r]//g;  
        $word = uc($word);
        $hash{$word} = 1;
    } 
    return \%hash;
}
