FROM alpine
COPY pdns.conf /etc/powerdns/
RUN apk --no-cache add pdns pdns-backend-geoip && \
	mkdir -p /usr/share/GeoIP && cd /usr/share/GeoIP/ && \
    wget https://mailfud.org/geoip-legacy/GeoIP.dat.gz && \
    wget https://mailfud.org/geoip-legacy/GeoIPv6.dat.gz && \
    gzip -d *
CMD ["/usr/sbin/pdns_server","--guardian=no","--daemon=no","--disable-syslog","--log-timestamp=no","--write-pid=no","--config-dir=/etc/powerdns"]