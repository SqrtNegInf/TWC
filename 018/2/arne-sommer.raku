#!/usr/bin/env raku

srand 1;

#use lib "lib";
#use PriorityQueue;

class PriorityQueue {

has %!queue;

method is_empty
{
  return ! %!queue.elems;
}

method insert_with_priority ($payload, Int $priority)
{
  say ":: $payload ($priority)";

  %!queue{$priority}.push: $payload;
}

method pull_highest_priority_element
{
  my $priority = %!queue.keys.max;

  # say "Q: $priority -> " ~ @(%!queue{$priority});

  my $element = @(%!queue{$priority}).shift;

  %!queue{$priority}:delete unless @(%!queue{$priority}).elems;

  return $element;
}

}

my $PQ = PriorityQueue.new;

#$PQ.insert_with_priority("AA$_", (^99).pick) for ^10;
my @foo = < 36 68 81 33 57 8 4 63 63 77>;
$PQ.insert_with_priority("AA$_", @foo[$_]) for ^10;

while ! $PQ.is_empty
{
  say $PQ.pull_highest_priority_element;
}
