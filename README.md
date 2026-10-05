# Convox Build Action
This Action [builds](https://docs.convox.com/deployment/builds) an app based on a [convox.yml](https://docs.convox.com/application/convox-yml) so that app can be deployed on Convox

## Inputs
### `rack`
**Required** The name of the [Convox Rack](https://docs.convox.com/introduction/rack) you wish to build against.
### `app`
**Required** The name of the [app](https://docs.convox.com/deployment/creating-an-application) you wish to build.
### `cached`
**Optional** Whether to utilise the docker cache during the build. Defaults to true.
### `description`
**Optional** Allow setting description for a build.

## Outputs
### `release`
The ID of the release that is created when the build completes. Available via `${{ steps.<id>.outputs.release }}` (GITHUB_OUTPUT) and as the `$RELEASE` environment variable (GITHUB_ENV) for downstream steps.
## Example usage
```
uses: convox/action-build@v2
with:
  rack: staging
  app: myapp
```

## Convox CLI version
This action installs the latest Convox CLI release when its image is built, so the action's version tag does not pin the CLI. On GitHub-hosted runners that happens on every run. On a self-hosted runner with a persistent Docker daemon, the CLI stays at the version cached in that daemon until its build cache is pruned.
