#!/usr/bin/env raku

use Test;

my @Test =

    ("ab", "c"),        ("a", "bc"),    True,
    ("ab", "c"),        ("ac", "b"),    False,
    ("ab", "cd", "e"),  ("abcde",),     True,
    ( "", "", ""),      ("",),          True,

;
my @Chunk-test =    # .bufsiz = 3
    ("",),              ("",),
    ("a",),             ("a", ""),
    ("", "a", ""),      ("a", ""),
    ("a", ""),          ("a", ""),
    ("ab",),            ("ab", ""),
    ("ab", "c"),        ("abc", ""),
    ("a", "bc"),        ("abc", ""),
    ("abc", ""),        ("abc", ""),
    ("abcd",),          ("abc", "d", ""),
    ("abcde",),         ("abc", "de", ""),
    ("abcde", ""),      ("abc", "de", ""),
    ("abcdef", ""),     ("abc", "def", ""),
    ("abcdefg",),       ("abc", "def", "g", ""),
    <a bc de fg>,       ("abc", "def", "g", ""),
    <ab cd ef g>,       ("abc", "def", "g", ""),
    <a bcdefg>,         ("abc", "def", "g", ""),
    <ab cdefg>,         ("abc", "def", "g", ""),
    <abc defg>,         ("abc", "def", "g", ""),
    <abcd efg>,         ("abc", "def", "g", ""),
    <abcde fg>,         ("abc", "def", "g", ""),
    <abcdef g>,         ("abc", "def", "g", ""),
    ("","a","b","","c","","","","def","g", ""),     ("abc", "def", "g", ""),
;

plan (2 × @Test ÷ 3) + @Chunk-test ÷ 2;

sub join-eq( @a, @b) {
    when @a.join eq @b.join { True }
    False
}

class Iter-by-buf {       # put in caller while not a proper iter
    has @.a           is required;
    has UInt $.bufsiz is required;
    has UInt $.idx    is rw = 0;
    has UInt $.pos    is rw = 0;
    has $.done              = "";

    #  Return the next $.bufsiz Chars @.a or a smaller tail.
    method next( --> Str) {
        my $want = $.bufsiz;
        my $ret;
        loop {
            if not @.a[$.idx] :exists {     # do last or done 
                return $.done without $ret;
                return $ret;
            }
            if @.a[$.idx] eq "" {           # skip empty Str elems
                ++ $.idx;
                next;
            }
            if @.a[$.idx].chars - $.pos > $want {   # want from current elem
                $ret ~= @.a[$.idx].substr: $.pos..^($.pos + $want);
                $.pos += $want;
                return $ret;
            }
            if @.a[$.idx].chars - $.pos < $want {  # partial want from current
                my $tmp = @.a[$.idx].substr: $.pos;
                $want -= $tmp.chars;
                ++ $.idx;
                $.pos = 0;
                $ret ~= $tmp;
                next;
            }
            # fallthrough to the default odd case
           $ret ~= @.a[$.idx].substr: $.pos; # want consumes balance of current
           ++$.idx;
           $.pos = 0;
           return $ret;
        }
        die "REACHED: Stupid programmer put this here.";
    }
} # class Iter-by-buf

sub by-chunks( @a, @b, $char-ct = 3) {
    my $a-iter = Iter-by-buf.new: bufsiz => $char-ct, a => @a;
    my $b-iter = Iter-by-buf.new: bufsiz => $char-ct, a => @b;  # loop here?

    loop {
        when $a-iter.next ne $b-iter.next {
            return False
        }
        when $a-iter.next eq (my $b = $b-iter.next) {
            return True if $b eq  $b-iter.done;
            next
        }
    }
    die "REACHED: Programmer not sufficiently competent!"

}

my $siz = 3;    # size of chunks
for @Chunk-test -> @in, @exp {
    my $iter = Iter-by-buf.new: :bufsiz($siz), :a(@in);
    my @got;
    loop {
        @got.push: $iter.next;
        last if @got[*-1] eq $iter.done
    }
    is @got, @exp, "@in.raku() -> @exp.raku()";
}

for @Test -> @a, @b, $exp {
    is join-eq(@a, @b), $exp, "join-eq: @a.raku()  @b.raku() -> $exp";
    is by-chunks( @a, @b, $siz), $exp,
        "by-chunks: @a.raku()  @b.raku() -> $exp";
}

done-testing;

my @arr1 = ("ab", "cad", "cdefghijklmno", "pqrst", "uvwx", "yz");
my @arr2 = ("abcadcdefghijklmnopqrstuv", "", "wxyz",);

say "\n\nInput: @arr1 = @arr1.raku()\n       @arr2 = @arr2.raku()",
    "\nOutput: &by-chunks(@arr2, @arr1, 10)";

@arr2[1] = "N";
say "\n\nInput: @arr1 = @arr1.raku()\n       @arr2 = @arr2.raku()",
    "\nOutput: &by-chunks(@arr2, @arr1, 10)";
