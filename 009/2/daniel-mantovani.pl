#!/usr/bin/env perl
use v5.36;

sub rank {
    my ( $order, $mode, @inp ) = @_;

  # first we order @inp by "score" key, taking into account the "order" argument
    @inp = sort { $a->{score} * $order <=> $b->{score} * $order } @inp;

    # now we add the key "rank", according to the $mode argument
    if ( $mode == 1 ) {

# standard ranking, we just copy index of the array (+1) for scores different from former score
#
        $inp[0]{rank} = 1;
        for my $i ( 1 .. $#inp ) {
            if ( $inp[$i]{score} == $inp[ $i - 1 ]{score} ) {
                $inp[$i]{rank} = $inp[ $i - 1 ]{rank};
            }
            else { $inp[$i]{rank} = $i + 1 }
        }
    }
    elsif ( $mode == 2 ) {

     # modified ranking, the opossite of the standard for equally ranked entries
     #
        $inp[-1]{rank} = @inp;
        for my $i ( reverse 0 .. $#inp - 1 ) {
            if ( $inp[$i]{score} == $inp[ $i + 1 ]{score} ) {
                $inp[$i]{rank} = $inp[ $i + 1 ]{rank};
            }
            else { $inp[$i]{rank} = $i + 1 }
        }
    }
    elsif ( $mode == 3 ) {

        # dense ranking, similar to standard
        #
        $inp[0]{rank} = 1;
        for my $i ( 1 .. $#inp ) {
            if ( $inp[$i]{score} == $inp[ $i - 1 ]{score} ) {
                $inp[$i]{rank} = $inp[ $i - 1 ]{rank};
            }
            else { $inp[$i]{rank} = $inp[ $i - 1 ]{rank} + 1 }
        }
    }
    return @inp;
}

sub print_ranking {
    say "Rank\tScore\tName";
    say sprintf( "%s\t%s\t%s", $_->{rank} // 'N/A', $_->{score}, $_->{name} )
      for @_;
    say "";
}

# now prints 3 examples

my @input = (
    { score => 8,  name => 'foo' },
    { score => 7,  name => 'bar' },
    { score => 8,  name => 'baz' },
    { score => 10, name => 'best' }
);

say "First example, standard ranking";
print_ranking(rank(-1,1, @input));
say "Second example, modified ranking";
print_ranking(rank(-1,2, @input));
say "Second example, dense ranking";
print_ranking(rank(-1,3, @input));
