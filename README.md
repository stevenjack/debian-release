# Debian release

Debian packages build their distribution and version number
from the lines in the `debian/changelog` file. It's cumbersome
to update this file each time you want to do another build of the
package.

This container is used for updating the `debian/changelog` automatically
using the `git-dch` debian package. This automatically updates the 
changelog based on the current commit, the version number and
tags the current commit.

## Usage

```bash
$: docker run -v $(pwd):/app smaj/debian-release \
"$(git config --global user.name)" \
"$(git config --global user.email)" \
"$(git rev-parse --abbrev-ref HEAD)"
```

The three parameters we pass in are:

* Git username
* Git email
* current branch

These are needed because the container automatically updates the
change log then commits the change as `Release X` on behalf of the
current user, this is why the name and email are needed.
