#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Test2::V0 -no_srand;
use Set::Tiny;

is(count_common([("Perl", "is", "my", "friend")], 
     ["Perl", "and", "Raku", "are", "friend"]), 2, 'Example 1');
is(count_common([("Perl", "and", "Python", "are", "very", "similar")], 
     ["Python", "is", "top", "in", "guest", "languages"]), 1, 'Example 2');
is(count_common([("Perl", "is", "imperative", "Lisp", "is", "functional")], 
     ["Crystal", "is", "similar", "to", "Ruby"]), 0, 'Example 3');


is (count_common([qw(Fear is the path to the dark side)],
     [qw(Fear leads to anger)], [qw(Anger leads to hate)],
     [qw(Hate leads to suffering)]), 1, 'Example Yoda');
done_testing();     

sub count_common
{
     my @word_groups = @_;
     my $data;
     for my $idx (0 .. $#word_groups)
     {
          my %freq;
          do ($freq{$_}++) for @{$word_groups[$idx]};
          $data->[$idx] = \%freq;
     }

     my $s0 = Set::Tiny->new( grep $data->[0]{$_} == 1, keys %{$data->[0]});

     for my $idx ( 1 .. $#$data )
     {
          my $s_next = Set::Tiny->new(grep $data->[$idx]{$_} == 1, keys %{$data->[$idx]});
          $s0 = $s0->intersection($s_next);
     }
     return scalar $s0->members;
}
