#!/usr/bin/env raku

sub MAIN( Str $letter-string ='crate') {
    my $letters = $letter-string.fc.comb.Bag;

    .say for 'words'.IO.lines.grep: { .fc.comb.Bag ⊆ $letters }

}
