## set your name and email
usethis::use_git_config(user.name = "Ian Kim",
                        user.email ="iannsydney@gmail.com")

## create a personal access token (PAT) for authentication
usethis::create_github_token()

## set personal access token
credentials::set_github_pat("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")

