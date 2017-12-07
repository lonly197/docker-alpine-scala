# docker-alpine-scala

> This is a Base and Clean Docker Image for Scala Programming Language.

## Build

```bash
docker build --build-arg VCS_REF=`git rev-parse --short HEAD` \
--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
--rm \
-t lonly/docker-alpine-scala:2.12.4 .
```

# Usage

$ docker run --rm lonly/docker-alpine-scala scala -e 'object HelloWorld extends App { println("Hello World") }; HelloWorld.main(null)'
Once you have run this command you will get printed 'Hello World' from Scala!

## License

![License](https://img.shields.io/github/license/lonly197/docker-alpine-scala.svg)

## Contact me

- Email: <lonly197@qq.com>