#!/usr/bin/env raku

class ÜberNaïvePriorityQueue {
    has @!elements;

    method is-empty() {
        return @!elements.elems == 0;
    }

    method insert-with-priority( $value, $priority ) {
        @!elements.push( %( :$value, :$priority ) );
    }

    method pull-highest-priority-element() {
        return if self.is-empty;

        # Find the first highest priority element.
        my $max-pair = @!elements.map( { .<priority> } ).maxpairs.first;

        # Remove and return the first element with the highest priority.
        return @!elements.splice( $max-pair.key, 1 ).first.<value>;
    }
}


use Test;

my $q = ÜberNaïvePriorityQueue.new;
ok $q.is-empty, 'q is empty';

my @cases = 
    # ( value, priority )
    ( 'a', 17 ),
    ( 'x', 33 ),
    ( 'y', -1 ),
    ( 'b', 17 ),
;
for @cases -> $case {
    $q.insert-with-priority( |@$case );
}

nok $q.is-empty, 'q is not empty';
is $q.pull-highest-priority-element, 'x', 'x is highest';
is $q.pull-highest-priority-element, 'a', 'a is next highest';
is $q.pull-highest-priority-element, 'b', 'b is same priority, but second';
is $q.pull-highest-priority-element, 'y', 'y is lowest';
ok $q.is-empty, 'q is empty';

exit 0;


