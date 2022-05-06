#!/usr/bin/env raku

sub group(@items) {
    my %groups;
    my $rank = 1;
    my $current = @items[0];

    for @items -> $item {
        if $item !~~ $current {
            $rank++;
            $current = $item;
        }
        %groups{$rank}.push($item);
    }

    return %groups;
}

sub denseRank(%groups) {
    my @results;
    for %groups.keys.sort -> $rank {
        for %groups{$rank}.list -> $item {
            @results.push(Pair.new($rank, $item));
        }
    }

    return @results;
}

sub modifiedRank(%groups) {
    my @results;
    my $total = 0;
    for %groups.keys.sort -> $rank {
        $total += %groups{$rank}.elems;
        for %groups{$rank}.list -> $item {
            @results.push(Pair.new($total, $item ));
        }
    }

    return @results;
}

sub standardRank(%groups) {
    my @results;
    my $total = 1;
    for %groups.keys.sort -> $rank {
        for %groups{$rank}.list -> $item {
            @results.push(Pair.new($total, $item ));
        }
        $total += %groups{$rank}.elems;
    }

    return @results;
}

sub display(@results) {
    for @results -> Pair $result {
        say $result.key, ' -> ', $result.value;
    }
}

sub dense (
    *@items,            #= a list of items to rank
) {
    @items.sort ==> group() ==> denseRank() ==> display();
}

sub modified (
    *@items,
) {
    @items.sort ==> group() ==> modifiedRank() ==> display();
}

sub standard (
    *@items,
) {
    @items.sort ==> group() ==> standardRank() ==> display();
}

dense(<3 8 1 3 6>); say '---';
modified(<3 8 1 3 6>); say '---';
standard(<3 8 1 3 6>);
