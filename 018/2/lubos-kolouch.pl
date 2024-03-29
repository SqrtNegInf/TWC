#!/usr/bin/env perl
use v5.36;

sub is_empty {
    my $hash_ref = shift;

    return %{$hash_ref} ? 0 : 1;

}

sub insert_with_priority {
    my ( $hash_ref, $priority, $element ) = @_;

    my %queue = %{$hash_ref};

    push @{ $queue{$priority} }, $element;

    return %queue;
}

sub pull_highest_priority_element {
    my $hash_ref = shift;

    foreach my $priority ( sort { $b <=> $a } keys %$hash_ref ) {

        my $element = shift @{ %${hash_ref}{$priority} };

        # destroy the queue if not neede

        delete $$hash_ref{$priority} unless scalar @{ %${hash_ref}{$priority} };

        return $element;
    }

    return 1;
}

###### MAIN ######

###### TESTS ######

use Test::More;

say 'TESTS:';
my %empty;
my %not_empty = ( '1' => 'a' );

is( is_empty( \%empty ),     1, 'Testing empty queue' );
is( is_empty( \%not_empty ), 0, 'Testing not empty queue' );

my %queue = insert_with_priority( \%empty, '1', 'aaa' );

is( $queue{1}[0], 'aaa', 'Testing added string equal to aaa' );
isnt( $queue{1}[0], 'aab', 'Testing added string not equal to bbb' );

is( pull_highest_priority_element( \%queue ), 'aaa', 'is highest priority aaa' );
is( is_empty( \%queue ),                      1,     'is the queue empty now' );

%queue = insert_with_priority( \%queue, '2', 'aaa' );
is( $queue{2}[0], 'aaa', 'Insert priority 2 element aaa' );

%queue = insert_with_priority( \%queue, '3', 'bbb' );
is( $queue{2}[0], 'aaa', 'Is still priority 2 element aaa' );
is( $queue{3}[0], 'bbb', 'Insert priority 3 element bbb' );

%queue = insert_with_priority( \%queue, '1', 'xxx' );
is( $queue{2}[0], 'aaa', 'Is still priority 2 element aaa' );
is( $queue{3}[0], 'bbb', 'Is still priority 3 element bbb' );
is( $queue{1}[0], 'xxx', 'Is still priority 1 element xxx' );
isnt( $queue{1}[0], 'aaa', 'Is priority 1 element not  aaa' );

%queue = insert_with_priority( \%queue, '3', 'ccc' );
is( $queue{2}[0], 'aaa', 'Is still priority 2 element aaa' );
is( $queue{3}[0], 'bbb', 'Is still priority 3 element bbb' );
is( $queue{1}[0], 'xxx', 'Is still priority 1 element xxx' );
is( $queue{3}[1], 'ccc', 'Is now second priority 3 element ccc' );

is( pull_highest_priority_element( \%queue ), 'bbb', 'bbb correctly pulled' );
is( pull_highest_priority_element( \%queue ), 'ccc', 'ccc correctly pulled' );
is( pull_highest_priority_element( \%queue ), 'aaa', 'aaa correctly pulled' );
is( pull_highest_priority_element( \%queue ), 'xxx', 'xxx correctly pulled' );

is( is_empty( \%queue ), 1, 'is the queue empty now' );
done_testing;
