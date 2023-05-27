#!/usr/bin/env perl
use v5.36;

my $MATRIX_SIZE = 5;

my $HASH    = 0;
my $BSEARCH = 1;

my $TYPE = $HASH;
   #$TYPE = $BSEARCH if @ARGV && $ARGV [0] eq "bsearch";

#@ARGV = ();

#if ($TYPE == $HASH) {
    #
    # Read in a matrix of data
    #
    my %matrix;
    @matrix {<DATA> =~ /-?[0-9]+/g} = () for 1 .. $MATRIX_SIZE; 

    #
    # Print 0/1 depending on whether the given number is in the matrix or not.
    #
    my $target = 35; say exists $matrix {$target} || 0;
       $target = 39; say exists $matrix {$target} || 0;

    #exit;
#}

#if ($TYPE == $BSEARCH) {
    #
    # Use binary search to find a target value into a sorted set.
    #
    my sub bsearch ($matrix, $target) {
        my ($min, $max) = (0, $MATRIX_SIZE * $MATRIX_SIZE);
        while ($min < $max) {
            use integer;
            my $mid = ($min + $max) / 2;
            #
            # To map a 1-d coordinate c to a 2-d pair x, y, we use
            # x = floor (c / size), y = c % size.
            # 
            my $cmp = $$matrix [$mid / $MATRIX_SIZE]
                               [$mid % $MATRIX_SIZE] <=> $target;
            if    ($cmp < 0) {$min = $mid + 1}
            elsif ($cmp > 0) {$max = $mid}
            else  {return 1}
        }
        return (0)
    }

    #
    # Read in the matrix
    #
    
        my $matrix = [[  1,  2,  3,  5,  7 ],
             [  9, 11, 15, 19, 20 ],
             [ 23, 24, 25, 29, 31 ],
             [ 32, 33, 39, 40, 42 ],
             [ 45, 47, 48, 49, 50 ]];
    #my $matrix = [map {[<> =~ /-?[0-9]+/g]} 1 .. $MATRIX_SIZE];

    #
    # Check for existence for the rest of the data
    #
    $target = 35; say bsearch ($matrix, $target);
    $target = 39; say bsearch ($matrix, $target);

    #exit;
#}

__END__
l 2 3 5 7
9 11 15 19 20
23 24 25 29 31
32 33 39 40 42
45 47 48 49 50
