alias python=python3.10
alias pip=pip3.10
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

alias vim='nvim'
export EDITOR='nvim'
export KUBE_EDITOR="nvim"

alias code="open -a 'Visual Studio Code'"

alias weather="curl -X GET \"https://wttr.in/Bucharest?01AFq\""
alias fullweather="curl -X GET \"https://wttr.in/Bucharest\""

alias helm="/usr/local/bin/helm"

alias ls='lsd'

alias work="timer 60m && osascript -e 'display notification \"☕\" with title \"Work Timer is up!\" subtitle \"Take a Break 😊\" sound name \"Crystaly\"'" 
alias rest="timer 10m && osascript -e 'display notification \"💦\" with title \"Break is over!!\" subtitle \"Get back to work!\" sound name \"Crystal\"'"

alias ld=’eza -lD --icons’
alias lf=’eza -lf --color=always --icons | grep -v /’
alias lh=’eza -dl .* --group-directories-first --icons’
alias ll=’eza -al --group-directories-first --icons’
alias ls=’eza -alf --color=always --sort=size --icons | grep -v /’
alias lt=’eza -al --sort=modified --icons’
