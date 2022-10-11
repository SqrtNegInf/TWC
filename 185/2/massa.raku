#!/usr/bin/env raku

use Test;

is-deeply mask-code(<ab-cde-123 123.abc.420 3abc-0010.xy>),
   <xx-xxe-123 xxx.xbc.420 xxxx-0010.xy>,
   'Example 1';

is-deeply mask-code(<1234567.a a-1234-bc a.b.c.d.e.f>),
   <xxxx567.a x-xxx4-bc x.x.x.x.e.f>,
   'Example 2';

done-testing;

sub mask-code(+@list) {
    @list.map: { S:nth(1..4)/<[a..z0..9]>/x/ }
}
