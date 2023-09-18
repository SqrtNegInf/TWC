#!/usr/bin/env raku

say solution(<java javascript julia>);

our sub solution(@input) is export {
	@input.map( *.comb.Bag ).reduce(&infix:<∩>).kxxv;
}
