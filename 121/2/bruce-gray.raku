#!/usr/bin/env raku

# Travelling Salesman Problem - British Museum algorithm
sub tsp_short ( @G ) {
    sub cost_of ( @path ) {
        my $cost = sum map { @G[ .[0] ; .[1] ] },
                   (0, @path.head), (@path.tail, 0), |@path.rotor(2 => -1);

        return { :@path, :$cost };
    }

    return ( 1 .. @G.end ).permutations.map(&cost_of).min(*.<cost>);
}

# Travelling Salesman Problem - Branch-and-bound algorithm
sub tsp ( @G where { .elems == .[0].elems } ) {
    my @visited = False xx @G.elems;
    my %best = cost => Inf, path => [];

    sub minimum-weight-Hamiltonian-cycle ( $current_position, $cost_so_far, @path )  {

        my @current_row := @G[$current_position];
        my $cost = $cost_so_far + @current_row[0];

        # "Bound": No need to recurse further down if this branch has already lost.
        return if $cost > %best<cost>;

        my @could_visit_next = @visited.grep(:k, *.not) or do {

            if @current_row[0] { # Path exists back to origin
                %best = :$cost, :@path if $cost < %best<cost>;
            }

            # Recursion at max depth when @could_visit_next is empty,
            # regardless of whether path can return to origin.
            return;
        };

        # "Branch" down to every unvisited node at this level.
        for @could_visit_next -> $i {
            my $node_cost = @current_row[$i]
                or next; # Zero would mean same node or no route to node.

            # Mark as visited, recurse (incrementing cost&path), then undo the mark.
            @visited[$i] = True;
            &?ROUTINE( $i, $cost_so_far + $node_cost, (|@path, $i) );
            @visited[$i] = False;
        }
    }

    @visited[0] = True;
    minimum-weight-Hamiltonian-cycle( 0, 0, [] );

    return %best;
}

my @tests =
    (
        ( 0, 5, 2, 7 ),
        ( 5, 0, 5, 3 ),
        ( 3, 1, 0, 6 ),
        ( 4, 5, 4, 0 ),
    ),

;
say .&tsp_short for @tests; # .head;??
say .&tsp for @tests;
