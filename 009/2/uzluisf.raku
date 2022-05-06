#!/usr/bin/env raku

#use lib '.';
#use ModuleCH02;

#proto ranking( *@items where *.elems > 0, | ) { * }

#| Perform standard competition ranking with given @items.
multi ranking( *@items --> Array ) {
    my Int:D @rankings = 1;

    for 1..@items.end -> $i {
        @rankings[$i] = do 
            if @items[$i] cmp @items[$i-1] == Same { @rankings[$i - 1] }
            else { $i + 1 }
    }
    return @rankings;
}

#| Perform modified competition ranking with given @items.
multi ranking( *@items, :$modified! --> Array ) {
    my Int:D @rankings = 1;

    for 1..@items.end -> $i {
        @rankings[$i] = do 
            if @items[$i] cmp @items[$i-1] === Same {
                @rankings[$i-1]
            }
            elsif @items[$i-2] and
                  @items[$i-1] cmp @items[$i-2] === Same and
                  @items[$i] ≠ (@items[$i-1], @items[$i-2]).all
            {
                @rankings[$i-1] + 1
            }
            else {
                @rankings[$i-1] + 2
            }
    }
    return @rankings;
}

#| Perform dense competition ranking with given @items.
multi ranking( *@items, :$dense! --> Array ) {
    my Int:D @rankings = 1;

    for 1..@items.end -> $i {
        @rankings[$i] = do 
            if @items[$i] cmp @items[$i-1] === Same { @rankings[$i - 1] }
            else { @rankings.tail + 1 }
    }
    return @rankings;
}

sub rank( 
    *@scores where *.elems > 0,    #= Items to be ranked
    Str :r(:$ranking) = "standard" #=«Ranking to be used.
                                      Options: standard, modified and dense.
                                      Default: standard»
) {

    unless $ranking ∈ <standard modified dense> {
        note "Please provide an appropriate ranking option. " ~
             "See '$*PROGRAM -h' for help.";
        return;
    }

    my @rankings = do given $ranking {
        when 'standard' { ranking @scores            }
        when 'modified' { ranking @scores, :modified }
        when 'dense'    { ranking @scores, :dense    }
    }

    put 'Rankings: ', @rankings.join('–');
}

rank(<3 8 1 3 6>, ranking => 'standard');
rank(<3 8 1 3 6>, ranking => 'modified');
rank(<3 8 1 3 6>, ranking => 'dense');
