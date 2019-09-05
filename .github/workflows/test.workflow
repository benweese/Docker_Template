workflow "Publish container" {
  on = "push"
  resolves = ["Push"]
}
    
action "build" {
  uses = "actions/docker/cli@master"
  args = "build -t user/repo ."
}
