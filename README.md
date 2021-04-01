# `rescript-next`

<a href="https://github.com/MoOx/rescript-next?sponsor=1">
  <img width="140" align="right" alt="Sponsoring button" src="https://github.com/moox/.github/raw/main/FUNDING.svg">
</a>

[![GitHub package.json version](https://img.shields.io/github/package-json/v/MoOx/rescript-next) ![npm downloads](https://img.shields.io/npm/dm/rescript-next)](https://www.npmjs.com/package/rescript-next)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/MoOx/rescript-next/Build)](https://github.com/MoOx/rescript-next/actions)
[![License](https://img.shields.io/github/license/MoOx/rescript-next)](https://github.com/MoOx/rescript-next)  
[![GitHub followers](https://img.shields.io/github/followers/MoOx?style=social&label=Follow%20me)](https://github.com/MoOx)
[![Twitter Follow](https://img.shields.io/twitter/follow/MoOx?style=social&label=Follow%20me)](https://twitter.com/MoOx)
[![Sponsor my work](https://github.com/moox/.github/raw/main/FUNDING-button.svg)](https://github.com/MoOx/rescript-next?sponsor=1)

[ReScript](https://rescript-lang.org) bindings for [`Next.js`](https://nextjs.org/).

Exposed as `Next` module.

`rescript-next` X.y.\* means it's compatible with
`next` X.y.\*

## Installation

When
[`Next.js`](https://nextjs.org/)
is properly installed & configured by following their installation instructions,
you can install the bindings:

```console
npm install rescript-next
# or
yarn add rescript-next
```

`rescript-next` should be added to `bs-dependencies` in your
`bsconfig.json`:

```diff
{
  //...
  "bs-dependencies": [
    "@rescript/react",
    // ...
+    "rescript-next"
  ],
  //...
}
```

## Usage

Check out the [source file](./src/Next.res) to discover the API.

---

## Changelog

Check the [changelog](./CHANGELOG.md) for more informations about recent
releases.

---

## Contribute

Read the
[contribution guidelines](https://github.com/MoOx/.github/blob/main/CONTRIBUTING.md)
before contributing.

## Code of Conduct

I want this community to be friendly and respectful to each other. Please read
[my full code of conduct](https://github.com/MoOx/.github/blob/main/CODE_OF_CONDUCT.md)
so that you can understand what actions will and will not be tolerated.
