package Acme::CPANModules::GrepVariants;

use strict;
use Acme::CPANModulesUtil::Misc;

# AUTHORITY
# DATE
# DIST
# VERSION

my $description = <<'_';
This list catalogs various grep-like tools.

**1. Reimplementations**

grep (from <pm:PerlPowerTools>) simply tries to reimplement grep in Perl, as
part of the project to reimplement many Unix utilities in Perl. It has few
practical uses; mainly educational. The portability advantage of Perl is
probably minor as grep and many Unix utilities are now available on other
platforms including Windows.


**2a. Improvements in recursive searching against files**

<prog:ack>. Created in 2005 by Andy Lester, <pm:ack> is the granddaddy of
grep-like programs that try to improve the experience of using grep to search
for text in source code. ack skips VCS directories like `.git` or `.svn`, and
understands file types so it doesn't look into giant `.mp4`s and other binaries
by default. ack has spurred the development of its improvements (mostly in speed
aspect) like The Silver Searcher (`ag`) (implemented in C) or `ripgrep`
(implemented in Rust). `git` also now includes a `git-grep` utility (implemented
in C). ack has a website: <https://beyondgrep.com>. See also
<https://betterthanack.com>.

<prog:gre> (from <pm:App::Gre>) is a "grep clone using Perl regexp's with better
file filtering, defaults, speed, and presentation". It seems to focus on
providing many options to filter files (from including/excluding by file
extension, by matching against filename, by first line, by maximum directory
depth, and so on). It also offers some alternative output styles.


**2b. Improvements in searching for multiple patterns in no particular order**

Normally with the regular grep, to search for all 'foo' and 'bar' *in no
particular order*, you either have to do something like:

    % grep --color=always foo FILES | grep bar

or:

    % grep -P 'foo.*bar|bar.*foo' FILES

both of which get unwieldy if the number of patterns get higher. Or you can use
look-ahead:

    % grep -P '(?=.*foo)(?=.*bar)' FILES

but this does not capture (thus highlight) the patterns. To do that, you can
pipe to grep once more:

    % grep -P '(?=.*foo)(?=.*bar)' FILES | grep -P '(foo|bar)'

but you introduce the complications of double filtering (e.g. filenames in
FILES is now the subject of the second grep).

Note that searching for multiple patterns in particular order ('foo.*bar'), or
searching for aternates from multiple patterns ('foo|bar') is no problem in
grep.

Some tools have been written to make it easier to specify multiple patterns:

<prog:abgrep> (from <pm:App::abgrep>) sports a `--all` option to require all
patterns to appear in a line (in no particular order). Normally, when multiple
patterns are given (via multiple `-e` or `--regexp` options), grep will include
lines that just contain at least one of the patterns.

<prog:greple> (from <pm:App::Greple>). By default, greple only display lines
that contain all patterns, instead of just one. greple also has a few other
tricks up its sleeve, like configuration file to define complex regexes,
matching across lines, and Japanese text support.

<prog:grep-terms> (from <pm:App::GrepUtils>) is a grep wrapper to convert
multiple terms into a chain of look-ahead patterns like described above. This
allows you to use the standard grep.


**3. Variants: alternate ways of specifying regex**

Instead of specifying a pattern, with <prog:rpgrep> (from <pm:App::rpgrep>) you
can specify a pattern name in a <pm:Regexp::Pattern>::* module instead.

With <prog:wcgrep> (from <pm:App::wcgrep>) you can search using wildcard pattern
instead of regex, which is admittedly more limited than regex.


**4a. Variants: alternate source: repository (version control system) content and history**

For git, the abovementioned `git-grep` can search for files in the work tree as
well as commit content. For Mercurial, `hg grep` accomplishes the same.
Alternatively you can dump the history then use the standard `grep` to go
through it.


**4b. Variants: alternate source: Perl source code**

<prog:pmgrep> (from <pm:App::pmgrep>) lets you grep over locally installed Perl
modules. It's basically a shortcut for something like this:

    % pmlist -Rx | xargs grep PAT
    % grep PAT $(pmlist -Rx)

<prog:cpangrep> (from <pm:App::cpangrep>) is a CLI for web service
<https://cpan.grep.me>, which is no longer operating. To grep from files on
CPAN, use <https://metacpan.org>.

<prog:grepl> (from <pm:App::Grepl>) uses <pm:PPI> to let you grep over Perl
*documents*; it allows you to do things like: search only in Perl code comments
or inside string literals.

<prog:podgrep> (from <pm:pmtools>) greps from POD sections of Perl source.


**4c. Variants: alternate source: CSV**

<prog:csvgrep> (from <pm:csvgrep>)

<prog:csv-grep> (from <pm:App::CSVUtils>) allows you to apply Perl code against
rows of CSV.


**4d. Variants: alternate source: word lists**

<prog:wordlist> (from <pm:App::wordlist>) greps words from wordlist modules
(modules that contains word lists, see WordList).


**4e. Variants: other alternate sources**

<prog:grep-from-bash-history> (from <pm:App::BashHistoryUtils>).

<prog:grep-from-iod> (from <pm:App::IODUtils>).

<prog:grep-from-ini> (from <pm:App::INIUtils>).

<prog:grep-from-coin> (from <pm:App::CryptoCurrencyUtils>).

<prog:grep-from-exchange> (from <pm:App::CryptoCurrencyUtils>).

<prog:jgrep> (from <pm:App::JsonLogUtils>).

<prog:pdfgrep> (alias: <prog:grep-from-pdf>) (from <pm:App::PDFUtils>) searches
against text in PDF files (it's a wrapper for `pdftotext` utility and grep).

<prog:ptargrep> (from <pm:Archive::Tar>) searches against table of contents of
tar files.


**5a. Variants: searching URLs**

<prog:grep-url> (from <pm:App::grep::url>) greps URLs from lines of input. You
don't have to manually specify regex that matches URLs yourself; you can just
add additional criteria for the URLs, e.g. whether the host part must contain
some text, or whether a certain query parameter must match some pattern.


**5b. Variants: searching dates**

<prog:grep-date> (from L<App::grep::date>) greps for dates in lines of text.

<prog:dategrep> (from L<App::dategrep>) prints lines matching a date range.

_

our $LIST = {
    summary => 'List of grep-like CLI utilities available on CPAN',
    description => $description,
    entries => [
    ],
};

Acme::CPANModulesUtil::Misc::populate_entries_from_module_links_in_description;

1;
# ABSTRACT:

=head1 append:SEE ALSO

L<Acme::CPANModules::GoodInterfaces>
