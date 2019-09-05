workflow "push" {
  resolves = [
    "Push",
    "GitHub Action for Docker",
  ]
  on = "push"
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@fe7ed3ce992160973df86480b83a2f8ed581cd50"
  args = "build . "
  secrets = ["GITHUB_TOKEN"]
}
