#!/usr/bin/env raku

# https://perlweeklychallenge.org/blog/perl-weekly-challenge-113/

sub challenge( @tree_input ) {
  my $sum_nodes = @tree_input».List.flat.sum;
  return @tree_input.deepmap( $sum_nodes - *);
}

  use Test;

  my @tree_input = 
    (1,  
      (2,  
          (4,
            (),
            (7)
          ),
      ),  
      (3, 
          (5),
          (6)
       )
     );

  my @tree_output = 
    (27, 
      (26, 
        (24,
          (),
          (21)
        )
      ), 
      (25, 
          (23),
          (22)
      )
    );

  is challenge(@tree_input),@tree_output;

  done-testing;

