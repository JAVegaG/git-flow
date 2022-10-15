# Git-flow
## Release v0.1.4

To properly work using a version control system such as git it is necessary to know and understand the different workflows one could use in a project. Some of them are:

* _git-flow_
* _GitHub-flow_
* _Trunk-Based Development_

Each workflow has its advantages and use cases, however, one of the most popular is git-flow, which uses a branching strategy that consists of dividing different tasks into 5 branches:

* _main/master_: where the source code reflects production.

* _develop_:  where the source code reflects the next releases.

* _feature_: this is the name of each branch used to add new features to the source code, however, it only lasts until the feature it's completed, and then the branch is merged into develop.

* _release_: this is the name of each branch used to prepare the source code for subsequent releases. Once the release is ready this branch is merged into main and develop.

* _Hot-fix_: this branch is used to fix production problems that arise unexpectedly. Once solved, it is merged into main and develop.

Hence, one could say that this workflow has 2 main branches and 3 support branches in addition to a tagging strategy to differentiate every release. This can be seen in the following image:

![git-flow](https://nvie.com/img/git-model@2x.png)

## GitHub Pages

GitHub has a solution to deploy static web pages, and it is called GitHub pages. To use this service one has to have a GitHub repository, and activate the use of pages in the settings of the repository. Pages can be deployed either manually or automatically using a pipeline, in this case, the second option was used through GitHub Actions.

## GitHub Actions

GitHub itself provides the following template for deploying to pages using actions:

```
# Simple workflow for deploying static content to GitHub Pages
name: Deploy static content to Pages

on:
  # Runs on pushes targeting the default branch
  push:
    branches: ["main"]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  contents: read
  pages: write
  id-token: write

# Allow one concurrent deployment
concurrency:
  group: "pages"
  cancel-in-progress: true

jobs:
  # Single deploy job since we're just deploying
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Setup Pages
        uses: actions/configure-pages@v2
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v1
        with:
          # Upload entire repository
          path: '.'
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v1
```

From the template, one can identify the following characteristics of the action:

* _name_: the name of the pipeline.

* _on_: the branches that trigger the pipeline.

* _permissions_: necessary for GitHub to access, read or write on the repository.

* _concurrency_: allows setting a concurrent deployment considering a group of workers to run the pipeline.

* _jobs_: this is the actual configuration of the pipeline, so it needs to know what steps it must do, where it is supposed to run, and how it should handle the deployment. It is common to use existing actions on the workflow, for instance, _actions/checkout@v3_, _actions/configure-pages@v2_, _actions/upload-pages-artifact@v1_, and _actions/deploy-pages@v1_.