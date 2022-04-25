#!/usr/bin/env raku
use experimental :cached;

die 'not ok - disabled: runs forever';

sub graph (*@words) {
    my Array %graph;


    for @words -> $word {
        my $lastLetter = $word.substr(*-1, 1);
        for @words.grep(none /$word/) -> $other {
            if $other.substr(0, 1) eq $lastLetter {
                %graph{$word}.push($other);
            }
        }
    }

    return %graph;
}

sub traverse(Array %graph, $word, @path is copy) {
    @path.push($word);

    my @longest = @path;
    for %graph{$word}.Array -> $neighbor {
        if @path.grep(none /$neighbor/) {
            my @p = traverse(%graph, $neighbor, @path);
            if @p.elems > @longest.elems {
                @longest = @p;
            }
        }
    }

    return @longest;
}

sub MAIN() {
    my @words = <anne eric>;

    my Array %g = graph(@words);

    my @longest;
    for %g.keys -> $word {
        my @path = traverse(%g, $word, []);
        if (@path.elems > @longest.elems) {
            @longest = @path;
        }
    }

    @longest.join(q{ }).say;
}
