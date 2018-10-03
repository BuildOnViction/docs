# TomoChain Documentation

[![Join the chat at https://gitter.im/tomochain/docs](https://badges.gitter.im/tomochain/docs.svg)](https://gitter.im/tomochain/docs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

TomoChain [documentation](https://docs.tomochain.com).

## Requirements

- python
- virtualenv

## Contribute

Clone the project.

```bash
git clone https://github.com/tomochain/docs.git
```

Create a virtualenv for this project.

```bash
cd docs
virtualenv .env
```

Activate your virtualenv.

```bash
source .env/bin/activate
```

Install the required libraries in your project's virtualenv.

```
pip3 install -r requirements.txt
```

You can now edit some files and check your changes live by running a local server.
You can access it at [localhost:3000](http://localhost:3000/).

```
./ serve.sh
```

## Contribution guideline

### Branches

If you are a technical writer with assigned issues, please create one branch for each of them.

They should be named `tw/[id of the issue]`

`git checkout -b 24`

### Commits

Commits should start by a verb.

Example:

`fix typo in technical whitepaper`

### Markdown

When contributing to the documentation, please write one sentence per line.

This will not create a new paragraph as markdown require two blank line to create one.

It will help keep git diffs clearer.
When editing a file, if you see multiples sentences in one line, it would be welcomed if you split them.

Example:

```markdown
Hello, this is the first paragraph.
This is still the first paragraph and this is still on the same line.

This is on a new paragraph because there is two new lines.
```

Hello, this is the first paragraph.
This is still the first paragraph and this is still on the same line.

This is on a new paragraph because there is two new lines.
