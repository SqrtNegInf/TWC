#!/usr/bin/env raku

sub MAIN( ) {
    my %dict = % .classify-list: { word-key($_) }, 'words'.IO.lines».fc;

    my $max = %dict.values».elems.max;
    .say for %dict.values.grep: { .elems == $max };
}

sub word-key( Str $word ) { $word.fc.comb.sort.join }
