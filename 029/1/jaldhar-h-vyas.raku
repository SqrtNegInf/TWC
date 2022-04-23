#!/usr/bin/env raku

sub expand(Str $string) {
    $string ~~ / \{(.+)\} /;
 
    return $0.split(/\,\s*/).map({
        my $word = $_;
        (my $expansion = $string) ~~ s/\{.+\}/$word/;
        $expansion;
    });
}

sub MAIN(Str $string = 'Perl {Daily,Weekly,Monthly,Yearly} Challenge') {
    .say for expand($string);
}
