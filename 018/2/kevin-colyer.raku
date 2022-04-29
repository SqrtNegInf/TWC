#!/usr/bin/env raku

use Test;

class PriorityQueue {
    has $.priorityLevels = 11; # 0..n-1
    has $.items = 0;
    has $.lol=Array.new([] xx $!priorityLevels);

    method is_empty(--> Bool) {
        return False if $!items > 0;
        return True;
    };

    method insert_with_priority($p,$payload) {
        return Nil if 0 < $p >= $!priorityLevels;
        $!lol[$p].push($payload);
        $!items++;
        return $payload; # for chaining
    };

    method pull_highest_priority_element() {
        my $payload;
        return Nil if $.items==0;
        # walk list from high to low priority 0..^
        for ^$!priorityLevels -> $i {
            if $!lol[$i].elems>0 {
                $!items--;
                return $!lol[$i].shift;
            }
        }
        return Nil # shouldn't reach here.
    };
}

my $Q = PriorityQueue.new;

is $Q.is_empty,True,"Empty Q";
is $Q.insert_with_priority(10,"p10=low1"),"p10=low1","insert 1";
is $Q.insert_with_priority(10,"p10=low2"),"p10=low2","insert 1.1";
is $Q.insert_with_priority(100,"p10=low3"),Nil,"Error too low priority";
is $Q.insert_with_priority(0,"p0=high1"),"p0=high1","insert 2";
is $Q.insert_with_priority(0,"p0=high2"),"p0=high2","insert 2.1";
is $Q.pull_highest_priority_element,"p0=high1","Remove highest priority";
is $Q.pull_highest_priority_element,"p0=high2","Remove next highest priority";
is $Q.pull_highest_priority_element,"p10=low1","Remove next highest priority";
is $Q.pull_highest_priority_element,"p10=low2","Remove next highest priority";
is $Q.is_empty,True,"Empty Q";
is $Q.pull_highest_priority_element,Nil,"No more items to remove";

done-testing;
