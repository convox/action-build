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
The ID of the release that is created when the build completes. 
## Example usage
```
uses: convox/action-build@v1
with:
  rack: staging
  app: myapp
```