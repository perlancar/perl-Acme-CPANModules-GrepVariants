package Acme::CPANModules::GrepVariants;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use Acme::CPANModulesUtil::Misc;

my $description = <<'_';
**Improvements**

Created in 2005 by Andy Lester, <pm:ack> is the granddaddy of grep-like programs
that try to improve the experience of using grep to search for text in source
code. ack skips VCS directories like `.git` or `.svn`, and understands file
types so it doesn't look into giant `.mp4`s and other binaries by default. ack
has spurred the development of other ack improvements (mostly in speed aspect)
like The Silver Searcher (`ag`) or `ripgrep`. `git` also now includes a
`git-grep` utility. ack has a website: <https://beyondgrep.com>. See also
<https://betterthanack.com>.

<pm:App::Greple> and <pm:App::abgrep> try to make searching for multiple
patterns in grep easier. To search for all 'foo' and 'bar' in grep in no
particular order, you either have to do something like:

    % grep --color=always foo FILES | grep bar

or:

    % grep -P 'foo.*bar|bar.*foo' FILES

both of which get unwieldy if the number of patterns get higher. Or you can use
look-ahead:

    % grep -P '(?=.*foo)(?=.*bar)' FILES

but this does not capture (thus highlight) the patterns.

Note that searching for multiple patterns in particular order ('foo.*bar'), or
searching for aternates from multiple patterns ('foo|bar') is no problem in
grep.

greple also has a few other tricks up its sleeve, like configuration file to
define complex regexes, matching across lines, and Japanese text support.

Instead of specifying a pattern, with <pm:App::rpgrep> you can specify a pattern
name in a <pm:Regexp::Pattern>::* module instead.

**Reimplementations**

grep for <pm:PerlPowerTools> simply tries to reimplement grep in Perl, as part
of the project to reimplement many Unix utilities in Perl. It has few practical
uses.

**Searching Perl source code**

<pm:App::pmgrep> lets you grep over locally installed Perl modules. It's
basically a shortcut for something like this:

    % pmlist -Rx | grep PAT
    % grep PAT `pmlist -Rx`

<pm:App::Grepl> uses <pm:PPI> to let you grep over Perl *documents*; it allows
you to do things like: search only in Perl code comments or inside string
literals.

**Searching other than files: **

TODO

_

our $LIST = {
    summary => 'Grep-like CLI utilities available on CPAN',
    description => $description,
    entries => [
    ],
};

Acme::CPANModulesUtil::Misc::populate_entries_from_module_links_in_description;

1;
# ABSTRACT:

=head1 append:SEE ALSO

L<Acme::CPANModules::GoodInterfaces>
