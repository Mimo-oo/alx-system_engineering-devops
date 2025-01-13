# a manifest to install flash ensure it is version 2.1.0
package {'flask':
    ensure   => '2.1.0',
    provider => 'pip3',
}
