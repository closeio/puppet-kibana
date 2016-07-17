# Create kibana startup script and service
class kibana::service inherits kibana {

  case $::osfamily {
    'Debian': {
      $init_script = 'kibana/etc/init.d/kibana.Debian.erb'
    }
    default:{
      fail("Operating family ${::osfamily} not supported!")
    }
  }

  # startup script
  file { '/etc/init.d/kibana':
    ensure  => file,
    mode    => '0755',
    content => template($init_script),
    notify  => Service['kibana'],
  }

  service { 'kibana':
    ensure     => $service_ensure,
    enable     => $service_enabled,
    hasstatus  => true,
    hasrestart => true,
    require    => File['/etc/init.d/kibana']
  }

}
