#!/usr/bin/env perl
use v5.36;

sub max {    # numerical max
    my $max = shift;    # initialices with first element
    map { $max = $_ if $_ > $max } @_;    # max algorithm
    return $max;
}

# we define our queues as hash references, with priorities
# as keys and array of elements on each value;
# elements could be regular strings or any perl valid scalar
# i.e. hash or array references

#
# For example, a queue array at a particular moment could be
# something like:
#
# {1 => ['element x', 'element y'], 7 => ['element z']}

# checking if a queue is empty. Will return 1 or '' (false)
sub is_empty {
    my $q = shift;
    return !%$q;
}

# insert with priority will insert an element and return the new
# queue:

sub insert_with_priority {
    my ( $q, $e, $p ) = @_;    # current queue, element and priority
    push @{ $q->{$p} }, $e;    # so we have an array for every priority
    return $q;                 # returns new queue
}

# To pull highest priority element is probably the slowest part, as we
# will need to sweep all our queue priorities to find highest one,
# and also delete priority altogether when corresponding array ends
# empty

sub pull_highest_priority_element {
    my $q   = shift;                    # current queue
    my $max = max( keys %$q );          # find max numeric priority (O(n)) :(
    my $e   = shift @{ $q->{$max} };    # get oldest element for this priority
    delete $q->{$max}
      unless @{ $q->{$max} };           # check if there are remaining elements
    return ( $e, $q );                  # will return element and new queue
}

# an example, using all defined functions, could be:

my $queue = {};                         # empty initial queue
$queue = insert_with_priority $queue, 'el 1, highest priority',     10;
$queue = insert_with_priority $queue, 'el 2, pri 2, (1st element)', 2;
$queue = insert_with_priority $queue, 'el 3, pri 2, (2nd element)', 2;
$queue = insert_with_priority $queue, 'el 4, pri = 4',              4;
$queue = insert_with_priority $queue, 'el 5, pri 2, (3rd element)', 2;
$queue = insert_with_priority $queue, 'el 6, lowest priority',      1;
$queue = insert_with_priority $queue, 'el 7, pri 2, (4th element)', 2;
$queue = insert_with_priority $queue, 'el 8, pri 2, (5th element)', 2;

# now we will be retrieving element by element, highest priority first

my $i = 1;
my $el;
( $el, $queue ) = pull_highest_priority_element($queue),
  printf "#%d element: %s\n", $i++, $el
  while !is_empty($queue);

# resulting element order should be elements 1, 4, 2, 3, 5, 7, 8 and 6
