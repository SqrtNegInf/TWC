#!/usr/bin/env raku

my %*SUB-MAIN-OPTS = :named-anywhere;

#multi sub MAIN is hidden-from-USAGE { say $*USAGE; }

#| Given a list of paths returns the longest shared path between them
multi sub MAIN(
    @paths = </a/b/c/d /a/b/cd /a/b/cc /a/b/c/d/e>
) {
    my $seperator = $*SPEC.dir-sep; #= Optional directory seperator. Defaults to the system standard.
    my @checks = @paths.sort( { $^b.codes <=> $^a.codes } )[0].split($seperator)[1..*-2];
    my $path = $seperator;
    my $new-path = $path;
    while ( all( @paths ) ~~ / ^ $new-path / ) {
        $path = $new-path;
        $new-path ~= ( @checks.shift ~ $seperator );
    };
    say $path;
}
