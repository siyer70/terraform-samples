terraform {
  required_providers {
    github = {
        source = "integrations/github"
        version = "~> 5.0"
    }
  }
}

provider "github" {
  token = "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"
}

resource "github_repository" "demoRepo" {
  name = "repousingapi"
  description = "Repo created using Github API call"
  visibility = "public"
}
