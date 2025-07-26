# pkl-deb

Pkl modules for managing Debian package repository configurations.

## Overview

pkl-deb provides type-safe configuration templates for Debian/Ubuntu package management files:
- `SourcesList.pkl` - APT repository configuration (one-line format)
- `Sources.pkl` - APT repository configuration (deb822 format)
- `Deb822.pkl` - Generic deb822 format utilities

## Installation

For installation instructions and usage examples, see the **[latest release notes](https://github.com/declix/pkl-deb/releases/latest)**.

Quick start - Add to your `PklProject`:

```pkl
dependencies {
    ["pkl-deb"] {
        uri = "package://pkl.declix.org/pkl-deb@X.Y.Z"
    }
}
```

## Usage

### Sources Module (deb822 format)

Create modern .sources files by amending the Sources module:

```pkl
amends "package://pkl.declix.org/pkl-deb@X.Y.Z#/Sources.pkl"

headerComment = "My repository configuration"

entries = new Listing {
    // Basic Debian repository
    new Entry {
        uris = new Listing { "http://deb.debian.org/debian" }
        suites = new Listing { "bookworm" }
        components = new Listing { "main"; "contrib"; "non-free" }
    }
    
    // Repository with options
    new Entry {
        uris = new Listing { "https://download.docker.com/linux/debian" }
        suites = new Listing { "bookworm" }
        components = new Listing { "stable" }
        architectures = new Listing { "amd64" }
        signedBy = "/usr/share/keyrings/docker-archive-keyring.gpg"
        trusted = false
    }
}
```

### SourcesList Module (one-line format)

Create traditional sources.list files:

```pkl
import "package://pkl.declix.org/pkl-deb@X.Y.Z#/SourcesList.pkl"

new SourcesList.SourcesList {
    entries = new Listing {
        new SourcesList.Entry {
            archiveType = "deb"
            uri = "http://deb.debian.org/debian"
            suite = "bookworm"
            components = new Listing { "main"; "contrib"; "non-free" }
        }
    }
}
```

## Examples

See the [examples/](examples/) directory for complete examples.

## Testing

```bash
pkl test
```

## License

MIT