#!/usr/bin/env perl
use v5.36;

my $tree = eval "[1,[[2,[4,5]],[3,[6,7]]]]";

# insert code here to check for a valid arrayref full binary tree #

print stringify_fbt(invert_fbt($tree));

exit;

#Invert an arrayref full binary tree (fbt)
sub invert_fbt {
    my $node = shift;

    my $value    = $node->[0];
    my $children = $node->[1];

    # are children leaves?
    if (ref $children->[0] ne 'ARRAY') {
        return  [   $value,
                    [ $children->[1], $children->[0] ]
                ];
    }
    else {
        return  [   $value,
                    [ invert_fbt($children->[1]), invert_fbt($children->[0]) ]
                ];
    }
}

#Make a string from an arrayref full binary tree (fbt)
sub stringify_fbt {
    my $node = shift;
    my $add_comma = shift // 0;

    my $value    = $node->[0];
    my $children = $node->[1];

    my $format  = $add_comma ? ',' : '';

    # are children leaves?
    if (ref $children->[0] ne 'ARRAY') {
        $format .= '[%d,[%d,%d]]';
        return sprintf $format,
                       $value,
                       $children->[0],
                       $children->[1];
    }
    else {
        $format .= '[%d,[%s%s]]';
        return sprintf $format,
                       $value,
                       stringify_fbt($children->[0],0),
                       stringify_fbt($children->[1],1);
    }
}

__END__

./ch-1.pl [1,[2,3]]
[1,[3,2]]

./ch-1.pl [1,[[2,[4,5]],[3,[6,7]]]]
[1,[[3,[7,6]],[2,[5,4]]]]

./ch-1.pl [1,[[3,[[7,[15,14]],[6,[13,12]]]],[2,[[5,[11,10]],[4,[9,8]]]]]]
[1,[[2,[[4,[8,9]],[5,[10,11]]]],[3,[[6,[12,13]],[7,[14,15]]]]]]

./ch-1.pl [1,[[2,[[4,[8,9]],[5,[10,11]]]],[3,[[6,[12,13]],[7,[14,15]]]]]]
[1,[[3,[[7,[15,14]],[6,[13,12]]]],[2,[[5,[11,10]],[4,[9,8]]]]]]
