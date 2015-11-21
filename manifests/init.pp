service { iptables:
  ensure => stopped,
}

package { "epel-release":
  ensure => latest,
}

-> class { redis: }

