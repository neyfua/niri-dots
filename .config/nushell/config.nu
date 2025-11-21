## aliases
alias ls = eza --icons always
alias grep = grep --color=auto

alias nv = nvim

alias py = python3 
alias c = gcc
alias cpp = g++

alias ga = git add
alias gc = git commit
alias gp = git push

## starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

## yazi
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}
