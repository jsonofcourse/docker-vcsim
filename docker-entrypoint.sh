#!/bin/bash


function show_help {

cat <<EOF
Usage:	docker run -P vcsim [Options]

A vCenter/ESXi API simulator

Options:
	-h, --help					This help
	-E							Output vcsim variables to stdout

	Service Configuration

	-autostart					Autostart model created VMs (default true)
	-delay (int)				Method response delay across all methods
	-delay-jitter (float)		Delay jitter coefficient of variation (tip: 0.5 is a good starting value)
	-esx						Simulate standalone ESX
	-l							Listen address for vcsim (default "0.0.0.0:8989")
	-method-delay				Delay per method on the form 'method1:delay1,method2:delay2...'
	-password					Login password for the vcsim (any password allowed by default)
	-tls						Enable TLS (default true)
	-tlscert					Path to TLS certificate file (requires volume configured at runtime)
	-tlskey						Path to TLS key file (requires volume configured at runtime)
	-trace						Trace SOAP to stderr
	-tunnel						SDK tunnel port (default -1)
	-username					Login username for vcsim (any username allowed by default)

	Pre-defined resources

	-app (int)					Number of virtual apps per compute resource
	-cluster (int)				Number of clusters (default 1)
	-dc (int)					Number of datacenters (default 1)
	-ds (int)					Number of local datastores (default 1)
	-folder (int)				Number of folders
	-host (int)					Number of hosts per cluster (default 3)
	-pg (int)					Number of port groups (default 1)
	-pod (int)					Number of storage pods per datacenter
	-pool (int)					Number of resource pools per compute resource
	-standalone-host (int)		Number of standalone hosts (default 1)
	-vm (int)					Number of virtual machines per resource pool (default 2)

EOF

}


#
# default values
#

VC_OPT=""
LISTEN="0.0.0.0:8989"

while [[ $# -gt 0 ]]; do

	key="$1"

	case $key in
		-h|--help)
			show_help
			exit 1
			;;
		-E)
			VC_OPT="$VC_OPT -E -"
			shift
			;;
		-autostart)
			VC_OPT="$VC_OPT -autostart $2"
			shift 2
			;;
		-delay)
			VC_OPT="$VC_OPT -delay $2"
			shift 2
			;;
		-delay-jitter)
			VC_OPT="$VC_OPT -delay-jitter $2"
			shift 2
			;;
		-esx)
			VC_OPT="$VC_OPT -esx"
			shift
			;;
		-l)
			LISTEN="$2"
			shift 2
			;;
		-method-delay)
			VC_OPT="$VC_OPT -method-delay $2"
			shift 2
			;;
		-password)
			VC_OPT="$VC_OPT -password $2"
			shift 2
			;;
		-tls)
			VC_OPT="$VC_OPT -tls $2"
			shift 2
			;;
		-tlscert)
			VC_OPT="$VC_OPT -tlscert $2"
			shift 2
			;;
		-tlskey)
			VC_OPT="$VC_OPT -tlskey $2"
			shift 2
			;;
		-trace)
			VC_OPT="$VC_OPT -trace"
			shift
			;;
		-tunnel)
			VC_OPT="$VC_OPT -tunnel $2"
			shift 2
			;;
		-username)
			VC_OPT="$VC_OPT -username $2"
			shift 2
			;;
		-app)
			VC_OPT="$VC_OPT -app $2"
			shift 2
			;;
		-cluster)
			VC_OPT="$VC_OPT -cluster $2"
			shift 2
			;;
		-dc)
			VC_OPT="$VC_OPT -dc $2"
			shift 2
			;;
		-ds)
			VC_OPT="$VC_OPT -ds $2"
			shift 2
			;;
		-folder)
			VC_OPT="$VC_OPT -folder $2"
			shift 2
			;;
		-host)
			VC_OPT="$VC_OPT -host $2"
			shift 2
			;;
		-pg)
			VC_OPT="$VC_OPT -pg $2"
			shift 2
			;;
		-pod)
			VC_OPT="$VC_OPT -pod $2"
			shift 2
			;;
		-pool)
			VC_OPT="$VC_OPT -pool $2"
			shift 2
			;;
		-standalone-host)
			VC_OPT="$VC_OPT -standalone-host $2"
			shift 2
			;;
		-vm)
			VC_OPT="$VC_OPT -vm $2"
			shift 2
			;;
		*)
			echo "Unknown option $key"
			echo
			show_help
			exit 1
			;;
	esac
done

VC_OPT="$VC_OPT -l $LISTEN"

# build command
echo "vcsim $VC_OPT"

vcsim $VC_OPT

