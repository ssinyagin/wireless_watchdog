/sbin/ip route | egrep '^default ' | \
 sed -e 's,.* dev \([a-zA-Z0-9]*\).*,DEV=\1,' \
 >/usr/local/etc/wireless_watchdog

wget -q --no-check-certificate -O /usr/local/sbin/wireless_watchdog \
https://raw.githubusercontent.com/ssinyagin/wireless_watchdog/master/wireless_watchdog
chmod u+x /usr/local/sbin/wireless_watchdog

cat >/etc/cron.d/wireless_watchdog <<'EOT'
*/2 * * * * root /usr/local/sbin/wireless_watchdog
EOT

cat >/etc/logrotate.d/wireless_watchdog <<'EOT'
/var/log/wireless_watchdog {
  rotate 6
  monthly
  compress
  missingok
  notifempty
}
EOT

echo Installed wireless_watchdog

