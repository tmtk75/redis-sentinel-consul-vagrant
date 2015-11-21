class redis::sentinel (
  $confpath    = "/etc/redis-sentinel.conf",
  $port        = 26379,
  $master_ip   = "172.21.0.101",
  $master_port = 6379,
) {
  file { "$confpath":
    ensure  => present,
    mode    => 0644,
    content => template("redis/redis-sentinel.conf"),
  }
  -> service { "redis-sentinel":
    ensure => running,
  }

  File["$confpath"] ~> Service["redis-sentinel"]
}
