class cloudpassage(
  $apikey         = $cloudpassage::params::apikey,
  $agentkey       = $cloudpassage::params::agentkey,
  $repokey        = $cloudpassage::params::repokey,
  $tags           = $cloudpassage::params::tags,
  $dns            = $cloudpassage::params::dns,
  $readonly       = $cloudpassage::params::readonly,
  $manage_repo    = $cloudpassage::params::manage_repo,
  $service_ensure = $cloudpassage::params::service_ensure,
  $service_enable = $cloudpassage::params::service_enable,
) inherits cloudpassage::params {

  if $service_ensure != true and $service_ensure != false {
    if ! ($service_ensure in [ 'running','stopped']) {
      fail('service_ensure parameter must be running, stopped, true, or false')
    }
  }
  validate_string($apikey,$agentkey,$repokey)
  validate_bool($service_enable)
  validate_bool($dns)
  validate_bool($readonly)
  validate_bool($manage_repo)

  if $manage_repo {
  # if you have your own apt/yum module you can comment these out
  # I recommends puppetlabs-apt for apt
    case $::operatingsystem {
      /(?i:debian|ubuntu)/:        { include ::cloudpassage::apt }
      /(?i:redhat|centos|fedora|amazon)/: { include ::cloudpassage::yum }
      default: {}
    }
  }

  Class['cloudpassage::install'] ~> Class['cloudpassage::configure'] ~> Class['cloudpassage::service']

}
