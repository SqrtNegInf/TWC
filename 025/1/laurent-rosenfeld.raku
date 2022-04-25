#!/usr/bin/env raku

my @names = <audino bagon baltoy banette bidoof braviary bronzor carracosta charmeleon cresselia croagunk darmanitan deino emboar emolga exeggcute gabite girafarig>;

my %name-by-letter;
for @names -> $name {
    my $start-letter = substr $name, 0, 1;
    push %name-by-letter{$start-letter}, $name;
}

my @best-seq;
my $best-count = 0;
for @names -> $name {
    search-seq( [$name], $name.SetHash );
}
say "BEST SEQUENCES: ";
for @best-seq -> $item {
   say "$item";
}
say "Number of sequences: ", @best-seq.elems;
#say now - INIT now;

sub search-seq (@current-seq, $seen) {
    my $last-name = @current-seq[*-1];
    my $last-letter = substr $last-name, *-1, 1;
    my @next-candidates = grep {defined $_}, # Remove empty slots
        (@(%name-by-letter{$last-letter}) (-) $seen).keys;
    if ( @next-candidates.elems == 0) {
        my $count = @current-seq.elems;
        if $count > $best-count {
            @best-seq = @current-seq;
            $best-count = $count;
        } elsif ($count == $best-count) {
            push @best-seq, @current-seq;
        }
    } else {
        for @next-candidates -> $name {
            my @new-seq = | @current-seq, $name;
            search-seq( @new-seq, $seen ∪ $name.SetHash );
        }
    }
}
