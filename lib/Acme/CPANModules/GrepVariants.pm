package Acme::CPANModules::GrepVariants;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use Acme::CPANModulesUtil::Misc;

my $description = <<'_';
**1. Reimplementations**

grep from <pm:PerlPowerTools> simply tries to reimplement grep in Perl, as part
of the project to reimplement many Unix utilities in Perl. It has few practical
uses.


**2a. Improvements in recursive searching against files**

<prog:ack>. Created in 2005 by Andy Lester, <pm:ack> is the granddaddy of
grep-like programs that try to improve the experience of using grep to search
for text in source code. ack skips VCS directories like `.git` or `.svn`, and
understands file types so it doesn't look into giant `.mp4`s and other binaries
by default. ack has spurred the development of other ack improvements (mostly in
speed aspect) like The Silver Searcher (`ag`) or `ripgrep`. `git` also now
includes a `git-grep` utility. ack has a website: <https://beyondgrep.com>. See
also <https://betterthanack.com>.

<prog:gre> from <pm:App::Gre>


**2b. Improvements in specifying multiple patterns**

Normally with the regular grep, to search for all 'foo' and 'bar', you either
have to do something like:

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

Some tools have been written to make it easier to specify multiple patterns.

<prog:abgrep> from <pm:App::abgrep>.

<prog:greple> from <pm:App::Greple>. greple also has a few other tricks up its
sleeve, like configuration file to define complex regexes, matching across
lines, and Japanese text support.

<prog:grep-terms> from <pm:App::GrepUtils> all try to make searching for
multiple patterns in grep easier.


**3. Variants: alternate ways of specifying regex**

Instead of specifying a pattern, with <pm:App::rpgrep> you can specify a pattern
name in a <pm:Regexp::Pattern>::* module instead.


**4a. Variants: alternate source: Perl source code**

<prog:pmgrep> from <pm:App::pmgrep> lets you grep over locally installed Perl
modules. It's basically a shortcut for something like this:

    % pmlist -Rx | xargs grep PAT
    % grep PAT `pmlist -Rx`

<prog:cpangrep> from <pm:App::cpangrep> is a CLI for web service
<https://cpan.grep.me>, which is no longer operating. To grep from files on
CPAN, use <https://metacpan.org>.

<prog:grepl> from <pm:App::Grepl> uses <pm:PPI> to let you grep over Perl
*documents*; it allows you to do things like: search only in Perl code comments
or inside string literals.

<prog:podgrep> from <pm:pmtools> greps from POD sections of Perl source.


**4b. Variants: alternate source: CSV**

<prog:csvgrep> from <pm:csvgrep>

<prog:csv-grep> from <pm:App::CSVUtils> allows you to apply Perl code against
rows of CSV.


**4c. Variants: alternate source: word lists**

<prog:wordlist> from <pm:App::wordlist> greps words from wordlist modules
(modules that contains word lists, see WordList).


**4d. Variants: other alternate sources**

<prog:grep-from-bash-history> from <pm:App::BashHistoryUtils>.

<prog:grep-from-iod> from <pm:App::IODUtils>.

<prog:grep-from-ini> from <pm:App::INIUtils>.

<prog:grep-from-coin> from <pm:App::CryptoCurrencyUtils>.

<prog:grep-from-exchange> from <pm:App::CryptoCurrencyUtils>.

<prog:jgrep> from <pm:App::JsonLogUtils>

<prog:pdfgrep> (alias: <prog:grep-from-pdf>) from <pm:App::PDFUtils> searches
against text in PDF files (it's a wrapper for `pdftotext` utility and grep).

<prog:ptargrep> from <pm:Archive::Tar> searches against table of contents of tar
files.


**5a. Variants: searching URLs**

<pm:App::grep::url> greps URLs from lines of input. You don't have to manually
specify regex that matches URLs yourself; you can just add additional criteria
for the URLs, e.g. whether the host part must contain some text, or whether a
certain query parameter must match some pattern.


**5b. Variants: searching dates**

<prog:grep-date> from L<App::grep::date> greps for dates in lines of text.

<prog:dategrep> from L<App::dategrep> prints lines matching a date range.

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
