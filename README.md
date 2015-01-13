# Scripts and Helper

## Shell alias for local instance

```bash
alias pull="/some-path/scripts/pull.sh" # pull develop || pull || pull master
alias pull-all="/some-path/scripts/pull-all.sh" # pull project develop || pull project || pull project master
alias build-frontend="/some-path/scripts/build-frontend-all.sh" # build all frontends with npm install
```

## Shell alias for vm instance

```bash
alias link="/some-path/scripts/link.sh" # link all frontend into backend: link projectName [optional-directory]
alias link-all="/some-path/scripts/link-all.sh" # link one frontend into backend: link [optional-directory]
alias build-backend="/some-path/scripts/build-backend-all.sh" # build all backends with ant dev-clean
```
