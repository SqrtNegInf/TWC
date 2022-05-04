#!/usr/bin/env raku

([\*] (2..*).grep(*.is-prime)).map(*+1).first(! *.is-prime).say
