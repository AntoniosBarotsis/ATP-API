if grep -q Microsoft /proc/version; then
  apt-get install -y redis-server
  redis-server --daemonize yes
fi

Rscript app.R