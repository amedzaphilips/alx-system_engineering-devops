# Ensure that pip3 is installed
package { 'python3-pip':
  ensure => installed,
}

# Install Flask and its dependencies using pip
exec { 'install_flask_and_dependencies':
  command => 'pip3 install flask==2.1.0 werkzeug==2.0.3',
  path    => ['/usr/bin', '/usr/local/bin'],
  unless  => 'pip3 show flask | grep -q "Version: 2.1.0"',
  require => Package['python3-pip'],
}
