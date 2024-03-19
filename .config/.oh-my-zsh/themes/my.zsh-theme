local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

function node_prompt_version {
    if which node &> /dev/null; then
        echo "%{$fg_bold[green]%}\ue718 $(node -v) %{$reset_color%}"
    fi
}

local host_color="green"
if [ -n "$SSH_CLIENT" ]; then
  local host_color="red"
fi

PROMPT='%{$fg_bold[blue]%}%10c%{$reset_color%} $(git_prompt_info) $(node_prompt_version)
%{$fg_bold[cyan]%}%{$reset_color%} '


RPROMPT='${return_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[grey]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[grey]%}) %{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[grey]%})"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg_bold[magenta]%}↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[magenta]%}↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg_bold[magenta]%}↕%{$reset_color%}"
