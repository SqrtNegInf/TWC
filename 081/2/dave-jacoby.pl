#!/usr/bin/env perl
use v5.36;

use List::Util qw{max};

my $file = 'input';
$file = defined $file && -f $file ? $file : 'input';

frequency_sort($file);

sub frequency_sort( $file ) {
    if ( -f $file && open my $fh, '<', $file ) {
        my $corpus = join '', <$fh>;
        $corpus =~ s/[,\.\(\)\"]/ /g;
        $corpus =~ s/\'s/ /g;
        $corpus =~ s/--/ /g;
        my %words;
        for my $word ( split /\s+/, $corpus ) {
            $words{$word}++;
        }
        my $max = max values %words;

        for my $c ( 1 .. $max ) {
            my @words = sort grep { $words{$_} == $c } keys %words;
            say join ' ', $c, @words, "\n" if scalar @words;
        }

        close $fh;
    }
}
