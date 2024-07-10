FROM haproxy:2.9

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY --chmod=755 fly-entrypoint.sh /fly-entrypoint.sh
ENTRYPOINT ["/fly-entrypoint.sh"]
