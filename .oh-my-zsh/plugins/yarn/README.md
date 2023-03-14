# Yarn plugin

This plugin adds completion for the [Yarn package manager](https://yarnpkg.com/en/),
as well as some aliases for common Yarn commands.

To use it, add `yarn` to the plugins array in your zshrc file:

```zsh
plugins=(... yarn)
```

## Global scripts directory

It also adds `yarn` global scripts dir (commonly `~/.yarn/bin`) to the `$PATH`.
To disable this feature, set the following style in your `.zshrc`:

```zsh
zstyle ':omz:plugins:yarn' global-path no
```

## Aliases

| Alias | Command                                   | Description                                                                   |
| ----- | ----------------------------------------- | ----------------------------------------------------------------------------- |
| y     | `yarn`                                    | The Yarn command                                                              |
| ya    | `yarn add`                                | Install a package in dependencies (`package.json`)                            |
| yad   | `yarn add --dev`                          | Install a package in devDependencies (`package.json`)                         |
| yap   | `yarn add --peer`                         | Install a package in peerDependencies (`package.json`)                        |
| yb    | `yarn build`                              | Run the build script defined in `package.json`                                |
| ycc   | `yarn cache clean`                        | Clean yarn's global cache of packages                                         |
| yd    | `yarn dev`                                | Run the dev script defined in `package.json`                                  |
| yf    | `yarn format`                             | Run the dev script defined in `package.json`                                  |
| yga   | `yarn global add`                         | Install packages globally on your operating system                            |
| ygls  | `yarn global list`                        | Lists global installed packages                                               |
| ygrm  | `yarn global remove`                      | Remove global installed packages from your OS                                 |
| ygu   | `yarn global upgrade`                     | Upgrade packages installed globally to their latest version                   |
| yh    | `yarn help`                               | Show help for a yarn command                                                  |
| yi    | `yarn init`                               | Interactively creates or updates a package.json file                          |
| yin   | `yarn install`                            | Install dependencies defined in `package.json`                                |
| yln   | `yarn lint`                               | Run the lint script defined in `package.json`                                 |
| ylnf  | `yarn lint --fix`                         | Run the lint script defined in `package.json`to automatically fix problems    |
| yls   | `yarn list`                               | List installed packages                                                       |
| yout  | `yarn outdated`                           | Check for outdated package dependencies                                       |
| yp    | `yarn pack`                               | Create a compressed gzip archive of package dependencies                      |
| yrm   | `yarn remove`                             | Remove installed packages                                                     |
| yrun  | `yarn run`                                | Run a defined package script                                                  |
| ys    | `yarn serve`                              | Start the dev server                                                          |
| yst   | `yarn start`                              | Run the start script defined in `package.json`                                |
| yt    | `yarn test`                               | Run the test script defined in `package.json`                                 |
| ytc   | `yarn test --coverage`                    | Run the test script defined in `package.json` with coverage                   |
| yuc   | `yarn global upgrade && yarn cache clean` | Upgrade global packages and clean yarn's global cache                         |
| yui   | `yarn upgrade-interactive`                | Prompt for which outdated packages to upgrade                                 |
| yuil  | `yarn upgrade-interactive --latest`       | Prompt for which outdated packages to upgrade to the latest available version |
| yup   | `yarn upgrade`                            | Upgrade packages to their latest version                                      |
| yv    | `yarn version`                            | Update the version of your package                                            |
| yw    | `yarn workspace`                          | Run a command within a single workspace.                                      |
| yws   | `yarn workspaces`                         | Run a command within all defined workspaces.                                  |
| yy    | `yarn why`                                | Show why a package has been installed, detailing which other packages depend on it |
