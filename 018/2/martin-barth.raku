#!/usr/bin/env raku

# OK, compiles at least

class PriorityQueue {
    class Item {
        has Real $.prio;
        has Any $.element;
    }
    has @.elements;

    method insert-with-priority(Real:D $prio, Any:D $element) {
        my $item = Item.new(:$prio, :$element);
        my $new_pos = self!find-pos($prio, 0, @!elements.elems);
        @!elements.splice($new_pos, 0, $item);
    }

    method !find-pos($prio, Int $start, Int $end) {
        my $pos = (($start + $end) / 2);
        if $pos < 0 {
            return 0;
        } else {
            if $start == $end {
                return $start;
            } else {
                $pos = $pos.Int;
                my $item = @!elements[$pos];
                if $item.prio < $prio {
                    return self!find-pos($prio, $start, $pos);
                } else {
                    return self!find-pos($prio, $pos+1, $end);
                }
            }
        }
    }

    method is-empty(--> Bool) {
        return @!elements.elems == 0;
    }

    method pull-highest-priority-element(--> Any) {
        fail if self.is-empty;
        return @!elements.shift.element;
    }
}


my $PQ = PriorityQueue.new;

$PQ.insert-with-priority(5, "this is the first priority 5 item");
$PQ.insert-with-priority(5, "this is the second priority 5 item");
$PQ.insert-with-priority(4, "this is the first priority 4 item");
$PQ.insert-with-priority(4, "this is the second priority 4 item");
$PQ.pull-highest-priority-element.say;
$PQ.pull-highest-priority-element.say;
$PQ.pull-highest-priority-element.say;
$PQ.is-empty.say;
$PQ.pull-highest-priority-element.say;
$PQ.is-empty.say;
