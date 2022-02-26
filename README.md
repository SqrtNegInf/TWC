## PWC

The purpose of this repository is to collect Raku and Perl code from the Perl Weekly Challenge site
to make it easy to compare them, verify they work, etc. Aiming to add rough one/day until I have them all.

To Be Very Clear: None of the code is mine (I have never submitted anything to the PWC). I am
merely taking a subset of what's there for examination and testing.

The project is organized by challenge number, for each one there are just two directories, '1' and '2', for the pair of weekly tasks.
Within those directories the solutions bear the names of the authors (or their handles anyway). 
All mentions of 'perl6' are converted to 'raku', likewise
'perl5' is changed to just 'perl'. File extensions are '.raku' and '.pl' 
(and '.pm', '.rakumod' for modules).

Testing is *not* going to be as fine-grained as for the RC project. Basically, run and collect output, then
after updates to Raku (and to a much lesser extent Perl), rerun the code and see what shakes out. 
Git is my friend here: If program output changes, the 00-prefixed files will show up as modified.

## See Also

The individual author blogs listed each week are collected in the '00-blogs' file.

Of particular note:

[Bruce Gray](http://blogs.perl.org/users/bruce_gray/theweeklychallenge/)

[Arne Sommer](https://raku-musings.com/eban-cardano.html)

[Colin Crain](https://theweeklychallenge.org/blog/) has been providing synoptic reviews 
