<clickhouse>
  <storage_configuration>
      <disks>
          <disk1>
              <path>/var/lib/clickhouse/disk1/</path>
          </disk1>
          <disk2>
              <path>/var/lib/clickhouse/disk2/</path>
          </disk2>
      </disks>
      <policies>
          <!-- change multi_disk_policy to default to override the default storage when creating a table -->
          <multi_disk_policy>
              <volumes>
                  <volume1>
                      <disk>disk1</disk>
                  </volume1>
                  <volume2>
                      <disk>disk2</disk>
                  </volume2>
              </volumes>
          </multi_disk_policy>
      </policies>
  </storage_configuration>
</clickhouse>