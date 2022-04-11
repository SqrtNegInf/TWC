#!/usr/bin/env raku

use Test;

sub filterNobelIntegers(@set) {
    return if @set.elems < 3;
    # reverse the list because if there are two items greater than N then N must == 2 to be a nobel number
    # which is the index of the array item becing checked
    # for once zero indexed arrays work for us!
    my @ordered = @set.sort.reverse;
    my @ni;
    for 1..^@set.elems -> $i {
        if @ordered[$i]==$i  { @ni.append: @ordered[$i] };
    }
    return @ni;
}

# Tests
is filterNobelIntegers([2, 6, 1, 3]),(2),"Nobel int found in example";
is filterNobelIntegers([5, 6, 8, 3]),(3),"Nobel int found";
is filterNobelIntegers([5, 6, 8, 3,3]),(3),"Nobel int found";
is filterNobelIntegers([5, 6, 8, 3,3,3]),(3),"Nobel int found";
done-testing;

=finish

# helper sub
sub generateIntegerLists() {
    my @list = (1..50).roll xx (3+(0..17).roll);
}

# take 20 random sets and search for Nobel Integers
for ^20 {
    my @a = generateIntegerLists();
    my @ni=filterNobelIntegers(@a);
    
    print @ni.elems > 0 ?? "* " !! "  ";
    print "[{@a.sort}] does ";
    print "not " if @ni.elems==0;
    say "have a nobel integer(s) [{@ni}]";
}
