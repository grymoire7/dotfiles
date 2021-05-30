#!/bin/bash
# read-string.sh
# eg: my_string=$(./read-string.sh); echo "my_string: $my_string"

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

# zsh `read` manual - http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html#index-read
# 
# read [ -rszpqAclneE ] [ -t [ num ] ] [ -k [ num ] ] [ -d delim ]
#     [ -u n ] [ name[?prompt] ] [ name ... ]
# 
# -r         Raw mode: a ‘\’ at the end of a line does not signify line continuation and backslashes in the line
#            don’t quote the following character and are not removed.

if [ -n "$ZSH_VERSION" ]; then
  read -r "answer?"
else
  read -r answer
fi
echo "$answer"
