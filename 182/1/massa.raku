#!/usr/bin/env raku

(1,2,4,2,4,1).map(+*).maxpairs.head.key.say;
(1,2,4,2,4,1).maxpairs.head.key.say
