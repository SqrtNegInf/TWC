#!/usr/bin/env raku

class Vertex {
    has Int $.x;
    has Int $.y;

    method gist {
        return "($.x,$.y)";
    }
}

class Grid {
    ## a special case of a rectangular grid DAG where we can
    ## only progress rightwards or downwards between vertices
    has $.grid;

    method endpoint () {
        ## lower right corner of the grid
        return Vertex.new: :x(self.grid[0].end), :y(self.grid.end)
    }

    method down_edge ($vertex) {
        return Vertex.new: :x($vertex.x), :y($vertex.y + 1)
    }

    method right_edge ($vertex) {
        return Vertex.new: :x($vertex.x + 1), :y($vertex.y)
    }

    method sum_route ($route) {
        ## given a path of vertices, return the sum of the values
        my $sum = [+] $route.map( { $.grid[.y][.x] } );
        return $sum;
    }

    method out_of_bounds ($vertex) {
        ## Bool is vertex outside the grid?
        return ($vertex.x > self.endpoint.x || $vertex.y > self.endpoint.y)
                ?? True
                !! False
    }

}

sub MAIN (Bool :$v = False) {

    ## input
    my @grid = [1,  16, 12, 43, 48, 19],
               [13,  7,  9, 16, 26,  8],
               [23, 18,  6, 11, 15, 17],
               [22, 33, 28,  5, 36, 32],
               [38, 43,  9, 46,  3, 42],
               [56,  4, 66, 76, 25,  2],
               [27, 10, 58, 14, 68, 52];

    my $graph = Grid.new: :grid(@grid);
    my @paths;
    my $startpoint = Vertex.new: :x(0), :y(0);
    my $route = [$startpoint];

    find_nodes( $route, $startpoint, $graph, @paths );

    my $minpath = @paths.min( { $graph.sum_route( $_ ) } );
    my $minsum = $graph.sum_route( $minpath );

    ## output
    say "grid:"                                 if $v;
    (.fmt( '%3d', '  ' ).say for $graph.grid)   if $v;
    say "minimum sum: $minsum";
    say "route:";
    say $minpath                                if $v;
    $minpath.map( { $graph.grid[.y][.x] } ).join( ' ➔ ' ).say;
}

sub find_nodes ($route, $vertex, $graph, @paths) {

    if $vertex eqv $graph.endpoint( ) {
        @paths.push: $route;
        return;
    }
    for ($graph.down_edge( $vertex ), $graph.right_edge( $vertex )) -> $next_vertex {
        next if $graph.out_of_bounds( $next_vertex );
        my $new_path = [|$route, $next_vertex];
        find_nodes( $new_path, $next_vertex, $graph, @paths );
    }
}
