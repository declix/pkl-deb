# pkl-deb

Pkl modules for managing Debian package repository configurations.

## Overview

pkl-deb provides type-safe configuration templates for Debian/Ubuntu package management files:
- `sources.list` - APT repository configuration

## Installation

Add to your `PklProject`:

```pkl
dependencies {
    ["pkl-deb"] {
        uri = "package://pkl.declix.org/pkl-deb@0.0.0"
    }
}
```

## Usage

### SourcesList Module

Create APT repository configurations:

```pkl
import "package://pkl.declix.org/pkl-deb@0.0.0#/SourcesList.pkl"

// Basic Debian repository
new SourcesList.Entry {
    archiveType = "deb"
    uri = "http://deb.debian.org/debian"
    suite = "bookworm"
    components = new Listing { "main"; "contrib"; "non-free" }
}

// Repository with options
new SourcesList.Entry {
    archiveType = "deb"
    options = new SourcesList.EntryOptions {
        architectures = new Listing { "amd64" }
        signedBy = "/usr/share/keyrings/docker-archive-keyring.gpg"
    }
    uri = "https://download.docker.com/linux/debian"
    suite = "bookworm"
    components = new Listing { "stable" }
}

// Complete sources.list file
new SourcesList.SourcesList {
    entries = new Listing {
        // ... entries
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