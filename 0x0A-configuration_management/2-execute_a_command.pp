# create a manifest that kills a process named killmenow
exec { 'killing a process using pkill':
  command  => 'pkill -9 killmenow',
}
