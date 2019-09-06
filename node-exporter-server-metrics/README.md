# Node exporter server metrics dashboard

Based on https://github.com/finn-no/grafana-dashboards, adding "Disk Service
Time" graph.

## Original description

This a dashboard to give a quick overview of multiple servers. More than 6 will
make the dashboard seem messy, but it will work.

There is effort in trying to make the dashboard work for older versions of node
exporter as well as newer.

At the moment we're trying to maintain support for node exporter 0.13, which is
the version available through Debian Jessie. Keep this in mind when creating
Pull Requests.

## Original description from https://grafana.com/grafana/dashboards/405

A simple dashboard configured to be able to view multiple servers side by side.

Was originally designed to be similar to the default Munin server dashboard.
Effort has been made to make the CPU and Memory graphs to look similar to Munin
style graphs.

Features:

   * CPU (system, user, nice, iowait, steal, idle, irq, softirq, guest)
   * Memory (Apps, Buffers, Cached, Free, Sla, SwapCached, PageTables,
     VmallocUser, Swap, Committed, Mapped, Active, Inactive)
   * Load
   * Disk Space Used in percent
   * Disk Utilization per Device
   * Disk IOs per device (read, write)
   * Disk Throughput per Device (read, write)
   * Disk Queue Length
   * Disk Service Time
   * Context Switches
   * Network Traffic (In, Out)
   * Netstat (Established)
   * UDP stats (InDatagrams, InErrors, OutDatagrams, NoPorts)
   * Conntrack

Using negative Y-axes to be able to show both reads and writes in the same
graphs nicely.
