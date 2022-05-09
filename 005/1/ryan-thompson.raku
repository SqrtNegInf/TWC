#!/usr/bin/env raku

sub MAIN( Str $word = 'animal' ) {
    # 25 seconds. I'm hoping this will get faster as Raku matures...
    my %dict = % .classify-list: { word-key($_) }, 'words'.IO.lines».fc;

    .say for %dict{ word-key($word) };
}

sub word-key( Str $word ) { $word.fc.comb.sort.join }

=finish
# Here's a cute-but-very-slow version. Instructive, but .permutations
# really takes a long time on long words like ｢irresistible｣
# (12! = 479,001,600 permutations)
sub MAIN_cute_but_slow( Str $word ) {
    my $perm = set $word.fc.comb.permutations».join.unique;
    my $dict = set $*ARGFILES.lines».fc;
    .say for ($dict ∩ $perm).keys.sort;
}
