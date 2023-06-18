#!/usr/bin/env perl
use v5.36;

my @names = <audino bagon baltoy banette bidoof braviary bronzor carracosta charmeleon cresselia croagunk darmanitan deino emboar emolga exeggcute gabite girafarig>;

my %next;
for my $name (@names) {
    @{ $next{$name} }{
        grep substr($name, -1) eq substr($_, 0, 1), @names
    } = ();
}


sub longest_path {
    my @longest_paths = ([]);
    _longest_path([$_], {}, \@longest_paths) for @names;
    shift @longest_paths
        until @{ $longest_paths[0] } == @{ $longest_paths[-1] };
    return @longest_paths
}


sub _longest_path {
    my ($so_far, $used, $longest_paths) = @_;
    my @following = grep ! exists $used->{$_},
                    keys %{ $next{ $so_far->[-1] } };
    for my $f (@following) {
        undef $used->{$f};
        push @$so_far, $f;
        _longest_path($so_far, $used, $longest_paths);
        pop @$so_far;
        delete $used->{$f};
    }
    push @$longest_paths, [@$so_far] if @$so_far >= @{ $longest_paths->[-1] };
}


my @longest_paths = longest_path();

say "@$_" for @longest_paths;
say "There are ", scalar @longest_paths,
    " paths of length ", scalar @{ $longest_paths[0] };
