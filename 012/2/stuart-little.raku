#!/usr/bin/env raku

my %*SUB-MAIN-OPTS=:named-anywhere,;

sub MAIN(
    @DIRECTORIES = </a/b/c/d /a/b/cd /a/b/cc /a/b/c/d/e>,
    ) {
    my $separator = '/';
    @DIRECTORIES[0] ~~ m:exhaustive/(^.*) <?before $separator || $>/;
    say $/.map(*.Str).grep(! *.ends-with($separator)).first( -> $dir { @DIRECTORIES.all ~~ /^$dir(\/ || $)/ })
}
