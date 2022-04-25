#!/usr/bin/env raku

my @names = <audino bagon baltoy banette bidoof braviary bronzor carracosta charmeleon cresselia croagunk darmanitan deino emboar emolga exeggcute gabite girafarig>;

my $max_seq_count = 0;
my $max_length    = 0;


sub search_next (@name, @names_left) {

    for @names_left.kv -> $idx_cand, $name_cand {

         next unless $name_cand.defined;

         my $f = $name_cand.comb[0];
         my $l = @name[*-1].comb[*-1];

         last if $f gt $l;
         next if $f lt $l;

         my @name_new = |@name, $name_cand;

         # New record length ?
         if @name_new.elems >= $max_seq_count {
             if @name_new.elems > $max_seq_count {
                 $max_seq_count = @name_new.elems;
                 $max_length = join('', @name_new).chars;
                 say $max_seq_count, ',', $max_length, ' -> ', @name_new;
             } else {
                 my $len = join('', @name_new).chars;
                 if $len >= $max_length {
                     $max_length = $len;
                     say $max_seq_count, ',', $max_length, ' -> ', @name_new;
                 }
             }
         }
         splice (my @names_left_new = @names_left), $idx_cand, 1, Nil;
         search_next @name_new, @names_left_new;
    }
}

for @names.kv -> $idx, $name {
    splice (my @names_left = @names), $idx, 1, Nil;
    search_next (my @name = $name), @names_left;
}
