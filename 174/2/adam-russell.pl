#!/usr/bin/env perl
use v5.36;

package PermutationRanking{
    use Mars::Class;
    use List::Permutor;
    
    attr q/list/;
    attr q/permutations/;
    attr q/permutations_sorted/;
    attr q/permutations_ranked/;
    
    sub BUILD{
        my $self = shift;
        my @permutations;
        my %permutations_ranked;
        my $permutor = List::Permutor->new(@{$self->list()});
        while(my @set = $permutor->next()) {
            push @permutations, join(":", @set);
        }
        my @permutations_sorted = sort @permutations;
        my $rank = 0;
        for my $p (@permutations_sorted){
            $permutations_ranked{$p} = $rank;
            $rank++;
        }
        @permutations_sorted = map {[split(/:/, $_)]} @permutations_sorted;
        $self->permutations_sorted(\@permutations_sorted);
        $self->permutations_ranked(\%permutations_ranked);
    }
    
    sub permutation2rank{
        my($self, $list) = @_;
        return $self->permutations_ranked()->{join(":", @{$list})};
    }
    
    sub rank2permutation{
        my($self, $n) = @_;
        return "[" . join(", ", @{$self->permutations_sorted()->[$n]}) . "]";
    }
}

package main{
    my $ranker = PermutationRanking->new(list => [0, 1, 2]);
    print "[1, 0, 2] has rank " . $ranker->permutation2rank([1, 0, 2]) . "\n";
    print "[" . join(", ", @{$ranker->list()}) . "]"  . " has permutation at rank 1 --> " . $ranker->rank2permutation(1) . "\n";
}
