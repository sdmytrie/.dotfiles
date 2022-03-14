gcop() {
    git log \
        --reverse \
        --color=always \
        --format="%C(cyan)%h %C(blue)%ar%C(auto)%d \
                  %C(yellow)%s%+b %C(black)%ae" "$@" |
        fzf -i -e +s \
            --reverse \
            --tiebreak=index \
            --no-multi \
            --ansi \
            --preview="echo {} |
                       grep -o '[a-f0-9]\{7\}' |
                       head -1 |
                       xargs -I % sh -c 'git show --color=always % |
                       diff-so-fancy'" \
            --header "enter: view, C-c: copy hash" \
            --bind "enter:execute:$_viewGitLogLine | less -R" \
            --bind "ctrl-c:execute:$_gitLogLineToHash |
                    xclip -r -selection clipboard"
}

fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
fco_preview() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

