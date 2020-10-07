# commitizen-action-pr

Add [commitizen][cz] incredibly fast into your project!

## Features

- Check Pr title

Are you using [conventional commits][cc] and [semver][semver]?

Then you are ready to use this github action, the only thing you'll need is the
`.cz.toml` file in your project.

## Usage

1. In your repository create a `.cz.toml` file (you can run `cz init` to create it)
2. Create a `.github/workflows/bumpversion.yaml` with the Sample Workflow

### Minimal configuration

Your `.cz.toml` (or `pyproject.toml` if you are using python) should look like
this.

```toml
[tool.commitizen]
version = "0.1.0"  # This should be your current semver version
```

For more information visit [commitizen's configuration page][cz-conf]

## Sample Workflow

```yaml
name: Pull request validation

on:
  pull_request:
        types: ['opened', 'edited', 'reopened', 'synchronize']

jobs:
  bump_version:
    if: "!startsWith(github.event.head_commit.message, 'bump:')"
    runs-on: ubuntu-latest
    name: "Bump version and create changelog with commitizen"
    steps:
      - name: Check out
        uses: actions/checkout@v2
        with:
          fetch-depth: 0
          token: "${{ secrets.GITHUB_TOKEN }}"
      - name: Validate PR title with commitizen
        uses: CashStory/commitizen-action-pr@1.0.1


```


## Troubleshooting


## I'm not using conventional commits, I'm using my own set of rules on commits

If your rules can be parsed then you can build your own commitizen rules, you can
create a new commitizen python package or you can describe it on the `toml` conf itself.

[Read more about customization][cz-custom]

[by_design]: https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#example-using-multiple-events-with-activity-types-or-configuration
[cz-docs-ga]: https://commitizen-tools.github.io/commitizen/tutorials/github_actions/
[cz]: https://commitizen-tools.github.io/commitizen/
[cc]: https://www.conventionalcommits.org/
[semver]: https://semver.org/
[cz-conf]: https://commitizen-tools.github.io/commitizen/config/
[cz-custom]: https://commitizen-tools.github.io/commitizen/customization/
