% hledger(1) hledger _version_
% _author_
% _monthyear_

m4_dnl This man page is currently broken into smaller files as follows:
m4_dnl
m4_dnl hledger.1.m4.md
m4_dnl  examples.m4.md
m4_dnl  options.m4.md
m4_dnl  queries.m4.md
m4_dnl  commands.m4.md
m4_dnl   balance.m4.md
m4_dnl  addons.m4.md
m4_dnl  troubleshooting.m4.md

_web_({{
_docversionlinks_({{hledger}})
_toc_
}})

_man_({{

# NAME

hledger - a command-line accounting tool

# SYNOPSIS

`hledger [-f FILE] COMMAND [OPTIONS] [CMDARGS]`\
`hledger [-f FILE] ADDONCMD -- [OPTIONS] [CMDARGS]`

# DESCRIPTION

_hledgerdescription_
Tested on unix, mac, windows, hledger aims to be a reliable, practical
tool for daily use.
}})

This is hledger’s command-line interface (there are also curses and web
interfaces). Its basic function is to read a plain text file describing
financial transactions (in accounting terms, a general journal) and
print useful reports on standard output, or export them as CSV. hledger
can also read some other file formats such as CSV files, translating
them to journal format. Additionally, hledger lists other hledger-\* 
executables found in the user’s \$PATH and can invoke them as subcommands.

hledger reads _files_ 
If using `$LEDGER_FILE`, note this must be a real environment variable, 
not a shell variable.
You can specify standard input with `-f-`.

Transactions are dated movements of money between two (or more) named
accounts, and are recorded with journal entries like this:

_journal_({{
2015/10/16 bought food
 expenses:food          $10
 assets:cash
}})

For more about this format, see hledger_journal(5).

Most users use a text editor to edit the journal, usually with an editor
mode such as ledger-mode for added convenience. hledger’s interactive
add command is another way to record new transactions. hledger never
changes existing transactions.

To get started, you can either save some entries like the above in
`~/.hledger.journal`, or run `hledger add` and follow the prompts. Then
try some commands like `hledger print` or `hledger balance`. See
COMMANDS and EXAMPLES below.

_include_(examples.m4.md)
_include_(options.m4.md)
_include_(queries.m4.md)
_include_(commands.m4.md)
_include_(troubleshooting.m4.md)
_man_({{

# ENVIRONMENT

**COLUMNS**
The screen width used by the register command. 
Default: the full terminal width.

_LEDGER_FILE_

# FILES

Reads _files_

# BUGS

The need to precede options with `--` when invoked from hledger is awkward.

hledger can't render non-ascii characters when run from a Windows command prompt (up to Windows 7 at least).

When input data contains non-ascii characters, a suitable system locale must be configured (or there will be an unhelpful error).
Eg on POSIX, set LANG to something other than C.

}})
