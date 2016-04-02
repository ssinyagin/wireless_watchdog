/sbin/ip route | egrep '^default ' | \
 sed -e 's,.* dev \([a-zA-Z0-9]*\).*,DEV=\1,' \
 >/usr/local/etc/wireless_watchdog

wget -O /usr/local/sbin/wireless_watchdog \
https://raw.githubusercontent.com/ssinyagin/wireless_watchdog/master/wireless_watchdog
chmod u+x /usr/local/sbin/wireless_watchdog

cat >/etc/cron.d/wireless_watchdog <<'EOT'
*/2 * * * * root /usr/local/sbin/wireless_watchdog
EOT

