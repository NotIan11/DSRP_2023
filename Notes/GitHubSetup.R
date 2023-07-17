## set your name and email
usethis::use_git_config(user.name = "Ian Kim",
                        user.email ="iannsydney@gmail.com")

## create a personal access token (PAT) for authentication
usethis::create_github_token()

## set personal access token
credentials::set_github_pat("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")

library(usethis)
library(credentials)

