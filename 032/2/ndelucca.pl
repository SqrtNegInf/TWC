#!/usr/bin/env perl
use v5.36;

sub generate_bar_graph{

    my $dataRef = shift;
    my $sort_bit = shift || 2;

    my @sorted_by_value = sort { $dataRef->{$b} <=> $dataRef->{$a} } keys(%$dataRef);
    # We allways get the max value so we can graph in the same scale
    # Sacrifice speed (when asked to sort by label, we do it twice) over functionality
    my $max = $dataRef->{$sorted_by_value[0]};

    my @sorted_keys = @sorted_by_value;
    @sorted_keys = sort { $a cmp $b } keys(%$dataRef) if $sort_bit == 1;

    print "$_\t".bar($dataRef->{$_},$max)."\n" for @sorted_keys;

}

sub bar{
    my ($value,$max) = @_;
    my $scale = 60;
    my $bar_size = $value*$scale/$max;

    return "#"x$bar_size;
}

# By Value
generate_bar_graph({
    apple => 35.5,
    cherry => 12,
    banana => 60.9
});

generate_bar_graph({
    apple => 35.5,
    cherry => 12,
    banana => 60.9
},1);
