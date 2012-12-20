# Current git status.
local v_git='$(git_prompt_info)%{$reset_color%}'

# Show the return code, only if the last command failed.
local v_ret='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'

# Current directory --> ~/blah/blah
local v_cd='%{$fg[green]%}%~%{$reset_color%}'

# The current time --> [HH:MM:SS]
local v_time='%{$fg[blue]%}%D{[%I:%M:%S]}%{$reset_color%}'

# Left and right prompts.
PROMPT="${v_time} %# "
RPROMPT="${v_cd} ${v_git} ${v_ret}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}› %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"
