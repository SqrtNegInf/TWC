#!/usr/bin/env raku
for ([1,2], [3,4], [5,6], [1,2]),
    ([9,1], [3,7], [2,5], [2,5]) -> @test {
    @test>>.map({"[$^a, $^b]"}).flat.unique.say;
}
