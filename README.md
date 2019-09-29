# vcsim, Containerized

A dockerfile and bash script for executing [vcsim](https://github.com/vmware/govmomi/tree/master/vcsim).

## Build

```powershell
docker build -t vcsim
```

## Pull

```powershell
docker pull jsonofcourse/vcsim
```

## Run

```powershell
docker run -d -p 8989:8989 jsonofcourse/vcsim
```

### Options

#### Service Configuration

```powershell
-autostart             Autostart model created VMs (default true)
-delay (int)           Method response delay across all methods
-delay-jitter (float)  Delay jitter coefficient of variation (tip: 0.5 is a good starting value)
-esx                   Simulate standalone ESX
-l                     Listen address for vcsim (default "0.0.0.0:8989")
-method-delay          Delay per method on the form 'method1:delay1,method2:delay2...'
-password              Login password for the vcsim (any password allowed by default)
-tls                   Enable TLS (default true)
-tlscert               Path to TLS certificate file (requires volume configured at runtime)
-tlskey                Path to TLS key file (requires volume configured at runtime)
-trace                 Trace SOAP to stderr
-tunnel                SDK tunnel port (default -1)
-username              Login username for vcsim (any username allowed by default)
```

#### Pre-defined resources

```powershell
-app (int)             Number of virtual apps per compute resource
-cluster (int)         Number of clusters (default 1)
-dc (int)              Number of datacenters (default 1)
-ds (int)              Number of local datastores (default 1)
-folder (int)          Number of folders
-host (int)            Number of hosts per cluster (default 3)
-pg (int)              Number of port groups (default 1)
-pod (int)             Number of storage pods per datacenter
-pool (int)            Number of resource pools per compute resource
-standalone-host (int) Number of standalone hosts (default 1)
-vm (int)              Number of virtual machines per resource pool (default 2)
```
