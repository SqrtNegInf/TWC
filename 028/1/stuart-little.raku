#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle Perl5' if $*VM ~~ /jvm/;

use Inline::Perl5;

my $file=$*PROGRAM-NAME;

(! $file.IO.e) && die ("No such file.");
($file.IO.z) && do {
    say "empty";
    exit;
}

my $p5 = Inline::Perl5.new;
$p5.run(qq"print ((-B '$file') ? ('binary') : ('text')); print '\n'");
