# Kibana devs don't care about maintaining packages, so we have to install
# via download & extract -- fortunately Kibana isn't hard to install
class kibana::install inherits kibana {

  # Make sure kibana user & group exist
  group { 'kibana':
    ensure => present,
  }

  user { 'kibana':
    ensure     => present,
    gid        => 'kibana',
    membership => minimum,
    require    => Group['kibana']
  }

  # download/install kibana files
  exec { 'download_kibana':
    path    => [ '/bin', '/usr/bin', '/usr/local/bin' ],
    command => "curl -s -L ${download_path}/kibana-${version}.tar.gz | tar xz",
    cwd     => $install_root,
    creates => "${install_root}/kibana-${version}",
    require => User['kibana'],
    notify  => Exec['set_permissions'],
  }

  # Recursively manging permissions in the kibana install root with puppet
  # is slow and generates lots of logs on every puppet run.  So we just
  # use chown -R here instead.
  exec { 'set_permissions':
    command     => "/bin/chown -R kibana:kibana ${install_root}/kibana-${version}",
    refreshonly => true,
  }

  # create associated directories
  $kibana_dirs = [
    $babel_dir,
    $config_dir,
    $log_dir,
    $pid_dir
  ]
  file { $kibana_dirs:
    ensure  => directory,
    recurse => true,
    owner   => 'kibana',
    group   => 'kibana',
    require => User['kibana']
  }

  # symlink to kibana
  file { "${install_root}/kibana":
    ensure  => link,
    target  => "${install_root}/kibana-${version}",
    require => Exec['download_kibana']
  }

  # write logrotate config
  file { '/etc/logrotate.d/kibana':
    ensure  => file,
    content => template('kibana/logrotate.conf.erb')
  }

}
