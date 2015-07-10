# Scripts and Helper

## Shell alias for local instance

```bash
alias pull="/some-path/scripts/pull.sh" # pull develop || pull || pull master
alias pull-all="/some-path/scripts/pull-all.sh" # pull-all project develop || pull-all project
alias build-frontend="/some-path/scripts/build-frontend-all.sh" # build all frontends with npm install
alias branch-delete-all="/some-path/scripts/branch-delete-all.sh" # remove local branch on all projects
```

## Shell alias for vm instance

```bash
alias link="/some-path/scripts/link.sh" # link all frontend into backend: link projectName [optional-directory]
alias link-all="/some-path/scripts/link-all.sh" # link one frontend into backend: link [optional-directory]
alias build-backend="/some-path/scripts/build-backend-all.sh" # build all backends with ant dev-clean
alias setup-dev="/some-path/scripts/setup-dev-all.sh" # execute setup-dev script on all projects
```
