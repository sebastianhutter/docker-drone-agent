FROM alpine:3.6 as alpine

RUN apk add --no-cache bash

# extend the drone image with a working shell and cat
# so we can have a simple entrypoint script running
FROM drone/agent:0.8

COPY --from=alpine /bin/bash /bin/bash
COPY --from=alpine /bin/cat /bin/cat
# requirements for bash and cat
COPY --from=alpine /lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
COPY --from=alpine /lib/ld-musl-x86_64.so.1 /lib/libc.musl-x86_64.so.1
# requirements for bash
COPY --from=alpine /usr/lib/libreadline.so.6.3 /usr/lib/libreadline.so.6
COPY --from=alpine /usr/lib/libncursesw.so.6.0 /usr/lib/libncursesw.so.6

ADD build/docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/bin/bash" ]
CMD [ "/docker-entrypoint.sh" ]