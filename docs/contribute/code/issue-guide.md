# Issue Guide

This page outlines how the LuzFaltex team thinks about and handles issues. For us, issues represent actionable work that should be done at some future point. IT may be as simple as a small product or test bug or as large as the work tracking the design of a new feature. We will keep issues open even if the LuzFaltex team internally has no plans to address them in an upcoming release, as long as we consider the issue to fall under are purview.

## When we close issues

As noted above, we don't close issues just because we don't plan to address them in an upcoming release. So why do we close issues? There are a few major reasons:

1. Issues unrelated to LuzFaltex projects. When possible, we'll try to find a better home for the issue and point you to it.
1. Cross-cutting work better suited for another team. Sometimes the line between the framework and the product blurs. For some issues, we may feel that the work is better suited for the framework team or a particular project team or another partner. In these cases, we'll close the issue and open it with the partner team. If they end up not deciding to take on the issue, we can reconsider it here.

Sometimes after debate, we'll decide that an issue isn't a good fit. In that case, we'll also close it. Because of this, we ask that you don't start working on an issue until it's tagged with `up-for-grabs` or `api-approved`. Both you and the team will be unhappy if you spend time and effort working on a change we'll ultimately be unable to take. We try to avoid that.

## Labels

We use labels on our issues in order to classify them. We have the following categories per issue:

* **Area**: These area-* labels call out the assembly or assemblies the issue applies to. In addition to labels per assembly, we have a few other area labels: `aria-infrastructure` for issues that relate to our build or test infrastructure and `area-Meta` for issues that deal with the repository itself, the direction of the project, our processes, etc. See the [full list of areas] for more information(#areas).
* **Issue Type**: These labels classify the type of issue. We use the following types:
  * `bug`: Bugs in an assembly
  * `api-*`: Issues which should add APIs to an assembly (see the [API Review Process](api-review.md) for details).
  * `enhancement`: Improvements to an assembly which do not add new APIs (e.g. performance improvements, code cleanup).
  * `test bug`: Bugs in the tests for a specific assembly.
  * `test enhancement`: Improvements in the tests for a specific assembly (e.g. improving test coverage).
  * `documentation`: Issues related to documentation (e.g. incorrect documentation, enhancement requests).
  * `question`: Questions about the product, source code, etc.
* **Other**:
  * `up-for-grabs`: Small sections of work which we believe are well scoped. These sorts of issues are a good place to start if you're new. Anyone is free to work on these issues.
  * `needs more info`: Issues which need more information to be actionable. Usually this will be because we can't reproduce a reported bug. We'll close these issues after a little bit if we haven't gotten actionable information, but we welcome folks who have acquired more information to open the issue.
  * `blocked`: Issues which can't proceed until another issue is resolved.
  * `third-party`: Issues which are caused by a third-party library
  * `os-linux`, `os-windows`, `os-mac-os-x`: Identifies an issue as being related to a particular OS. Add as many of these as are appropriate.

In addition to the above, we have a handful of other labels we use to help classify our issues. Some these tag cross-cutting concerns whereas others are used to help us track additional work needed before closing an issue.

## Milestones

We use milestones to prioritize work for each upcoming release.

## Assignee

We assign each issue to an assignee, when the assignee is ready to pick up the work and start working on it. If the issue is not assigned to anyone and you want to pick it up, please say so - we will assign the issue to you. If the issue is already assigned with someone, please coordinate with the assignee before you start working on it.

## Areas

Areas are tracked by labels `area-*`. Each area typically corresponds with one or more contract assemblies.

| Area | Owners / Experts | Description
|----|----|----|
|area-Infrastructure|@foxtrek64|Covers: <ul><li>Packaging</li><li>Build and test infrastructure</li></ul><br/> |
|area-Meta|@foxtrek64|Issues without clear association to any API/Contract, e.g. <ul><li>New contract proposals</li><li>Project docs</li>|
|**Contract Assemblies**||
|LuzFaltex.Authentication|@foxtrek64|Reusable authentication library|

## Triage rules - simplified

1. Each issue has exactly one `area-*` label
1. Issue has no Assignee, unless someone is working on the issue at the moment
1. Use `up-for-grabs` as much as possible, ideally with a quick note about next steps / complexity of the issue.
1. Set milestone to **Future**
1. Each issue has exactly one "issue type" label (`bug`, `enhancement`, `api-needs-work`, `test bug`, `test enhancement`, `question`, `documentation`, etc.)
1. Don't be afraid to say no or close issues - just explain why and be polite
1. Don't be afraid to be wrong - just be flexible when new information appears.

Feel free to use any additional labels if it helps your triage efforts.

### Motivation for triage rules

1. Each issue has exactly one `area-*` label
   * Motivation: Issues with multiple areas have loose responsibility (everyone blames the other side) and issues are double counted in reports.
1. Issue has no **Assignee** unless someone is working on the issue at the moment.
   * Motivation: Observation is that contributors are less likely to grab assigned issues, no matter what the repo rules say.
1. Use `up-for-grabs` as much as possible, ideally with a quick note about the next steps / complexity of the issue.
   * Note: Per [up-for-grabs.net](http://up-for-grabs.net/), such issues should be no longer than a few night's worth of work. They should be actionable (i.e. no mysterious CI failures or issues that can't be tested in the open).
1. Set milestone to **Future**
   * Motivation: Helps communicate desire/timeline to the community. Can spark further priority/impact discussion.
1. Each issue has exactly one "issue type" label
   * Don't be afraid to be wrong when deciding `bug` vs `test bug` (flip a coin if you must). The most valuable values for tracking are `api-*` vs. `enhancement`, `question`, and `documentation`.
1. Don't be afraid to say no, or just close issues - just explain why and be polite.
1. Don't be afraid to be wrong - just be flexible when new information appears.

### PR Rules

1. Each PR has exactly one `area-*` label
   * Motivation: Area owners will get email notifications about new issues in their area.
1. PR as **Assignee** set to author of the PR. If it is a non-LuzFaltex engineer, then area owners are co-assignees.
   * Motivation: Area owners are responsible and do code reviews for PRs from external contributors. CoreFX engineers know how to get code reviews from others.
1. [Optional] Set milestone according to the branch (`master` = 2.1, `release/2.0` = 2.0, `release/1.0` = 1.0, etc.)
   * Motivation: Easier to track where fix ended and if it needs to be ported into another branch.
   * Note: This is easily done after merge via simple queries and bulk-edits. You don't have to do this one.
1. Any other labels on PRs that are superfluous and not needed (exceptions: `blocked`)
   * Motivation: All the important info ("issue type" label, api approval label, OS label, etc.) is already captured on the associated issue(s).
1. Stuck or long-term blocked PRs (e.g. due to missing API approval, etc.) should be be closed and reopened once they are unstuck.
   * Motivation: Keep only active and WIP PRs. If a PR is stale and there is not an immediate path forward, consider closing the PR until it is unblocked/unstuck.
1. PR should be linked to the related issue(s) using auto-closing tags (e.g. "Fixes #1234").