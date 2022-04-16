#!/usr/bin/env raku

no strict; # heh

print "ch-2.p6 (Version 1.0) PWC #40 Task #2: SubList\n";

# -----------------------------------------------
@a = (10,4,1,8,12,3);
@i = (0,2,5);

print "Before:", join(" - ", @a), "\n";
my @d = @a[0,2,5];
@a[0,2,5] = @d.sort( { .Int } );
print "After: ", join(" - ", @a), "\n";

# -----------------------------------------------
# p6doc -f Type::List.sort
