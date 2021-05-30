#!/bin/bash
# eg: my_char=$(read-char.sh); echo "my_char: $my_char"

# bash `read` manual - https://ss64.com/bash/read.html
# 
# read [-ers] [-a aname]  [-d delim] [-i text] [-n nchars]
#    [-N nchars] [-p prompt] [-r] [-s] [-t timeout] [-u fd]
#       [name...]
# 
#  -r        Do not treat a Backslash as an escape character.  The backslash is considered to be part
#            of the line. In particular, a backslash-newline pair can not be used as a line continuation.
#            Without this option, any backslashes in the input will be discarded.
#            You should almost always use the -r option with read.
#  -n nchars read returns after reading nchars characters rather than waiting for a complete line of input.

# zsh `read` manual - http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html#index-read
# 
# read [ -rszpqAclneE ] [ -t [ num ] ] [ -k [ num ] ] [ -d delim ]
#     [ -u n ] [ name[?prompt] ] [ name ... ]
# 
# -q         Read only one character from the terminal and set name to ‘y’ if this character was ‘y’ or ‘Y’
#            and to ‘n’ otherwise. With this flag set the return status is zero only if the character was ‘y’ or ‘Y’.
#            This option may be used with a timeout (see -t); if the read times out, or encounters end of file,
#            status 2 is returned. Input is read from the terminal unless one of -u or -p is present.
#            This option may also be used within zle widgets.
# -r         Raw mode: a ‘\’ at the end of a line does not signify line continuation and backslashes in the line
#            don’t quote the following character and are not removed.

if [ -n "$ZSH_VERSION" ]; then
  read -r -q "answer?"
else
  read -r -n 1 answer
fi
echo "$answer"
