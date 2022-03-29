#!/usr/bin/env raku

#| Read the given input file (default "input") and give a litst of
#| words grouped by count. 
sub MAIN ( Str $input-file = "input.txt" ) {
    my %map;
    for $input-file.IO.words.map( -> $x is copy { $x ~~ s:g/ "."|'"'|"("|")"|","|"'s"|"--" //; $x } ).Bag.antipairs -> $p {
        %map{$p.key} //= [];
        %map{$p.key}.push($p.value);
    }
    for %map.keys.sort {
        say "$_ {%map{$_}.sort.join(" ")}";
    }
}
