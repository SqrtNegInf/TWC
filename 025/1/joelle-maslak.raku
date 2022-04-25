#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot concurrency?' if $*VM ~~ /jvm/;

my @NAMES = <audino bagon baltoy banette bidoof braviary bronzor carracosta charmeleon cresselia croagunk darmanitan deino emboar emolga exeggcute gabite girafarig>;

my %NEXTONES;
for @NAMES -> $name {
    my $last-letter = $name.comb[*-1];
    %NEXTONES{$name} = @NAMES.grep( { $^a.comb[0] eq $last-letter } ).grep( { $^a ne $name } ).sort.list;
}

sub MAIN() {
    my @longest = build-longest();

    my $i = 1;
    for @longest -> $path {
        say "{$i++} ({$path.elems} elements): " ~ $path.map: { $^a.join(" ") };
    }
}

multi sub build-longest() {
    my $c = Channel.new();

    await @NAMES.map: {
        start { $c.send: [ build-longest( @( $_ ) ) ] }
    }
    $c.close;

    my @best-paths;
    for $c.list -> $new-path {
        if @best-paths.elems == 0 or $new-path[0].elems > @best-paths[0].elems {
            @best-paths = @($new-path);
        } elsif $new-path[0].elems == @best-paths[0].elems {
            @best-paths.append: @($new-path);
        }
    }

    return @best-paths;
}

multi sub build-longest($path) {
    my @best-paths = [ $path ];

    my @next-possible = %NEXTONES{$path[*-1]}.list;
    for (@next-possible ∖ @($path)).keys.sort -> $name {
        my @tmppath = @($path);
        @tmppath.append: $name;
        my $new-paths = build-longest(@tmppath);

        if $new-paths[0].elems > @best-paths[0].elems {
            @best-paths = @($new-paths);
        } elsif $new-paths[0].elems == @best-paths[0].elems {
            @best-paths.append: @($new-paths);
        }
    }

    return @best-paths;
}


