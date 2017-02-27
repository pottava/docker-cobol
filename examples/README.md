COBOL programs on docker
---

Build it,

`docker build -t cobol .`

Run it!

`docker run --rm -it -v $(pwd):/app cobol`

With arguments:

`docker run --rm -it -v $(pwd):/app -e APP_VERSION=dev -e APP_TARGET="Me?" cobol arg-1 "#$%&0-@:.<"`
