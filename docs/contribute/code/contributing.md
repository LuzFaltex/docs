# Contributing to LuzFaltex Code

This document describes contribution guidelines for LuzFaltex Code repos available both here on GitHub and on [code.luzfaltex.com](https://code.luzfaltex.com). The LuzFaltex Code team maintains the following guidelines for contributing to the LuzFaltex Code repos. If you have any questions regarding a specific policy, please feel free to reach out to the code team through our Discord (link coming soon) or create an issue.

General contribution guidance is included in this document. Additional guidance is defined in the documents linked below.

- [Copyright](copyright.md) describes the licensing practices for our projects.
- [Contribution Workflow](workflow.md) describes the workflow that the team uses for considering and accepting changes.

## Coding Style

We intend to develop code in full conformance with the style guidelines described in the [C# Coding Style](coding-style.md). However, sometimes older code may not follow the current style. Please refer to the notes below:

- **DO NOT** send PRs for style changes. For example, do not send PRs that are focused on changing the usage of `Int32` to `int`.
- **DO NOT** send PRs for upgrading code to use newer language features, though it's okay to use newer language features as part of new code that's written. For example, it's okay to use expression-bodied members as part of new code you write, but do not send a PR focused on changing existing properties or methods to use the feature.
- **DO** give priority to the current style of the project or file you're changing *even* if it diverges from the general guidelines.

In the event you find a document which contains code that does not conform to the Coding Style, please refer to the project's `CODE_OWNERS.TXT` to find the maintainer for the project and create an issue, tagging them in said issue and identifying the relevant code files.

## API Changes

- **DO NOT** submit PRs to change an API until the changes in the issues have been approved via the [API Review Process](api-review.md).

## Contribution "Bar"

Project maintainers will merge changes that improve the product significantly and broadly and that align with the Project Roadmap.

Maintainers will not merge changes that have narrowly-defined benefits due to compatibility risk. The LuzFaltex codebase is used by several LuzFaltex projects to enable minimization of code and efficiency. Other companies may build on top of LuzFaltex code, whether developing extensions or customizations, or leveraging an open source base library.

Contributions must also satisfy the other published guidelines defined in this document.

## Pull Requests

- **DO** submit all code changes via pull requests (PRs) rather than through a direct commit. PRs will be reviewed and potentially merged by the repo maintainers after a peer review that includes at least one maintainer.
- **DO** submit "work in progress" PRs. A work-in-progress PR should have `[WIP]` placed in the PR title before the title itself. This can be useful for grouping multiple issues into one.
- **DO** give PRs short but descriptive names (e.g. "Add LDAP authentication method to LuzFaltex.Authentication library", not "Fix #1234").
- **DO** refer to any relevant issues and include [keywords](https://help.github.com/articles/closing-issues-via-commit-messages/) that automatically close issues when the PR is merged.
- **DO** tag any users that should know about and/or review the change.
- **DO** ensure each commit successfully builds. The entire PR must pass all tests in the Continuous Integration (CI) system before it'll be merged.
- **DO** address PR feedback in an additional commit(s) rather than amending the existing commits, and only rebase/squash them when necessary. This makes it easier for reviewers to track changes.
- **DO** assume that ["Squash and Merge"](https://github.com/blog/2141-squash-your-commits) will be used to merge your commit unless you request otherwise in the PR.
- **DO NOT** fix merge conflicts using a merge commit. Prefer `git rebase`.
- **DO NOT** mix independent, unrelated changes in one PR. Separate real product/test code changes from large code formatting/dead code removal changes. Separate unrelated fixes into separate PRs, especially if they are in different assemblies.

## Merging Pull Requests (for contributors with write access)

- **DO** use ["Squash and Merge"](https://github.com/blog/2141-squash-your-commits) by default for individual contributions unless requested by the PR author. Do so even if the PR only contains one commit. It creates a simpler history than "Create a Merge Commit." Reasons that PR authors may request "Merge and Commit" may include (but are not limited to):

  - The change is easier to understand as a series of focused commits. Each commit in the series must be buildable so as not to break `git bisect`.
  - Contributor is using an email address other than the primary GitHub address and wants that preserved in the history. Contributor must be willing to squash the commits manually before acceptance.

## General DOs and DON'Ts

Please do:

- **DO** follow our [Coding Style](coding-style.md) (C# code-specific)
- **DO** give priority to the current style of the project or file you're changing even if it diverges from the general guidelines.
- **DO** include tests when adding new features. When fixing bugs, start with adding a test that highlights how the current behavior is broken.
- **DO** keep the discussions focused. When a new or related topic comes up it's often better to create a new issue than to side track the discussion.
  - **DO** Create a new issue for each major piece of a change (e.g. front-end UI changes, back-end UI changes, and underlying functionality) which you group together in the PR for the overall change.
- **DO** blog and tweet (or whatever) about your contributions frequently!

Please do not:

- **DON'T** make PRs for style changes
- **DON'T** surprise us with big pull requests. Instead, file an issue and start a discussion so we can agree on a direction before you invest a large amount of time.
- **DON'T** commit code that you didn't write. If you find code that you think is a good fit, file an issue and start a discussion before proceeding.
- **DON'T** submit PRs that alter licensing related files or headers. If you believe there's a problem with them, file an issue and we'll be happy to discuss it.
- **DON'T** add API additions without filing an issue and discussing it with us first. See the [API Review Process](api-review.md).

## Commit Messages

Please format commit messages as follows (based on [A Note About Git Commit Messages](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html))

    Summarize change in 50 characters or less

    Provide more detail after the first line. Leave one blank line below the
    summary and wrap all lines at 72 characters or less.

    If the change fixes an issue, leave another blank line after the final
    paragraph and indicate which issue is fixed in the specified format
    below.

    Fix #42

Also do your best to factor commits appropriately: not too large with unrelated things in the same commit, and not too small with the same change applied N times in N different commits.

## Contributor License Agreement

You must sign a [Contributor License Agreement](http://en.wikipedia.org/wiki/Contributor_License_Agreement) before your PR will be merged. This is a one-time requirement for our projects.

The Agreement: [LuzFaltex Contributor License Agreement](https://github.com/LuzFaltex/docs/tree/master/docs/legal/contribution-license-agreement-distributable.pdf)

You don't have to do this up front. You can simply clone, fork, and submit your pull-request as usual. When your pull-request is created, it is classified by a CLA bot. If the change is trivial (for example, you just fixed a typo), then the PR is labeled with `cla-not-required`. Otherwise it is classified as `cla-required`. Once you signed a CLA, the current and all future pull requests will be labelled as `cla-signed`.

## File Headers

The following file header is used for all LuzFaltex open source projects. Please use it for new files

```cs
// Licensed to LuzFaltex under one or more agreements.
// LuzFaltex licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.
```