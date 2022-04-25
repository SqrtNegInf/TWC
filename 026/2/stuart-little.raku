#!/usr/bin/env raku

say atan2(|(&sin,&cos).map( -> &f { (180,270,360).map((*.EVAL * pi / 180).&f).sum })) * 180 / pi
