#!/usr/bin/env raku

subset ValidFile of Str where *.IO.f;
my %*SUB-MAIN-OPTS = :named-anywhere;

multi sub MAIN(
    @files where all(@files) ~~ ValidFile = ['example.txt'], #= Files to read
) {
    read-files( IO::CatHandle.new( @files ), False );
}

sub read-files( IO::CatHandle $files, $csv ) {
    my %results := BagHash.new();
    %results{$_}++ for $files.lines;
    my $k-dist = %results.keys.map( *.codes ).max;
    my $v-dist = %results.values.map( *.codes ).max;
    my $fmt = $csv ?? '"%s",%d' !! "% -{$k-dist+2}s%{$v-dist+2}d";
    .say for %results.sort( *.value <=> *.value ).reverse.map( { sprintf($fmt,$_.key,$_.value) } );
}
