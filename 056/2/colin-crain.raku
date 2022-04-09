#!/usr/bin/env raku

srand 4;

sub MAIN ($depth = 3) {

    my @tree = generate_tree($depth);

    my $tstr = @tree.map({$_.defined ?? $_ !! "undef"}).join(', ');
    my $target = (($depth+1) * 4.5).Int;

    say qq:to/__END__/;
    tree:   $tstr
    target: $target

    paths found:
    __END__

    my $index = 0;
    my @working;
    my @paths;
    sum_path(@tree, $target, $index, @working, @paths);

    say "\nsolutions:\n";
    @paths.elems == 0 ?? say '(none)' !! ($_.join(' -> ').say for @paths);
}

## ## ## ## ## SUBS:

sub sum_path (@tree, $target, $index, @prev_working, @paths) {
## walks the tree and computes complete the path sum
    my @working = @prev_working;
    @working.append: @tree[$index];

    ## if we are at a terminal node check the sum and return
    if ( ! @tree[$index * 2 + 1].defined && ! @tree[$index * 2 + 2].defined ) {
        my $sum = [+] @working;
        @paths.push: @working if $sum == $target;

        say @working.join(' + ') ~ " = $sum";

        return;
    }

    for ( $index * 2 + 1, $index * 2 + 2 ) -> $child {
        sum_path( @tree, $target, $child, @working, @paths ) if @tree[$child].defined;
    }
}

sub generate_tree ($depth){
## automatically generates a random binary tree of rank n, with node values 1..10
## odds of a node being a terminator increase as the rank of the node increases
## which avoids trees with branches that quickly end
    my @tree;
    @tree[0]  = (^10).pick;            ## always defined
    my $nodes = (2**($depth+1)) - 2;   ## 0-based count to last node, (start of next rank - 1)

    for ( 0..$nodes ) -> $index {
        my $rank = get_rank($index);
        my $parent = (($index-1)/2).Int;
        if @tree[$parent].defined {
            ## the odds of the switch being 0 increase as the rank progresses
            ## the first node will always generate the next rank
            my $switch = $index > 0 ?? (^($nodes - 2 ** $rank)/2).pick.Int !! 1;
            @tree[$index] = $switch ?? (^10).pick !! Nil;
        }
    }
    return @tree;
}

sub get_rank ($n) {
## determines the rank of a node from its index
    return $n > 0 ?? (log($n+1)/log(2)).Int !! 0;
}

