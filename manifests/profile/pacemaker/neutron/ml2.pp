# Copyright 2016 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# == Class: tripleo::profile::pacemaker::neutron::ml2
#
# Neutron ML2 driver Pacemaker HA profile for tripleo
#
# === Parameters
#
# [*pacemaker_master*]
#   (Optional) The hostname of the pacemaker master
#   Defaults to hiera('bootstrap_nodeid')
#
class tripleo::profile::pacemaker::neutron::ml2 (
  $pacemaker_master = hiera('bootstrap_nodeid'),
) {

  warning('This class is going is deprecated and will be removed very soon, replaced by tripleo::profile::pacemaker::neutron::plugins::ml2.')

  include ::neutron::params
  include ::tripleo::profile::pacemaker::neutron

  class { '::tripleo::profile::base::neutron::plugins::ml2':
    sync_db => ($::hostname == downcase($pacemaker_master))
  }

}
