class redis {
  include install
  include config
  include service

  Class[config] ~> Class[service]

  include sentinel
}

class redis::install {
  package { "remi-release":
    ensure   => latest,
    source   => "http://rpms.famillecollet.com/enterprise/remi-release-6.rpm",
    provider => rpm,
  }

  -> package { redis:
    ensure => latest,
    install_options => "--enablerepo=epel,remi",
  }
}

class redis::config {
  $masterip   = "172.21.0.101"
  $masterport = 6379

  if ($::hostname == "node1") {
    $slave = false
  } else {
    $slave = true
  }

  file { "/etc/redis.conf":
    content => template("redis/redis.conf"),
  }
}

class redis::service {
  service { redis:
    ensure => running,
  }
}
