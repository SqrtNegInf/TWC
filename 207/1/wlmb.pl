#!/usr/bin/env perl

use v5.36;
say join " ", <Hello Alaska Dad Peace>, "->", grep {/^([qwertyuiop]+|[asdfghjkl]+|[zxcvbnm]+)$/i} <Hello Alaska Dad Peace>;
