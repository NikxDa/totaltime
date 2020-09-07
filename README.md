# totaltime
> A beautiful time calculation CLI 

<div align="center">
    <img alt="Header" src="images/pino-minimal.png" width="85%">
</div>

<p align="center">
    <a href="https://travis-ci.org/NikxDa/pino-minimal">
        <img alt="Travis Build Status" src="https://travis-ci.org/NikxDa/pino-minimal.svg?branch=master">
    </a>
    <a href="https://www.npmjs.com/package/pino-minimal">
        <img alt="NPM version" src="https://img.shields.io/npm/v/pino-minimal">
    </a>
</p>

## Description

The `totaltime` tool provides a quick and easy way to complete timesheet calculations right in the terminal.

## Contents

- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Command Line Arguments](#command-line-arguments)
- [License](#license)

## Installation

```bash
$ gem install totaltime
```

## Usage

To use it, call `totaltime` in your terminal. The app will guide you from there.

```bash
$ totaltime
```

## Time Format

To specify durations, you can pass multiple formats to `totaltime`. It will always let you know whether your input is valid or not and convert it into a readable duration.

| Input Format | Example | Description |
| ------------ | ------ | ----------- |
| `hh:mm` | `01:30`, `2:5` | The default duration format. |
| `:mm` | `:30`, `:90` | Specify just minutes. |
| `hh` | `2`, `5` | Specify just hours. |
| `h.f` | `1.5`, `.5` | Specify hours and minutes as a float. |

## Command Line Arguments

This package supports several command line arguments as specified below.

| Option/s | Type | Default | Description |
| -------- | ---- | ------- | ----------- |
| `--help`, `-h` | `boolean` | - | Show a help document. |

## License

MIT