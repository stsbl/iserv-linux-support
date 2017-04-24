/^\s*iptables -A FORWARD -j forward_white/a \
\
# Repository der Stadtteilschule Blankenese\
iptables_multidest repository.stsbl.de -A forward_white -p tcp --dport https \\\
  -j ACCEPT\
# Ubuntu-Updates\
iptables_multidest de.archive.ubuntu.com -A forward_white -p tcp --dport http \\\
  -j ACCEPT
/^\s*iptables -t nat -A PREROUTING -j always_direct/a \
\
# Repository der Stadtteilschule Blankenese\
iptables_multidest repository.stsbl.de -t nat -A always_direct -p tcp --dport https \\\
  -j ACCEPT\
# Ubuntu-Updates\
iptables_multidest de.archive.ubuntu.com -t nat -A always_direct -p tcp --dport http \\\
  -j ACCEPT
