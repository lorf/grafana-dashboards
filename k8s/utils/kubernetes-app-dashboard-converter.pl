#!/usr/bin/perl

use warnings;
use strict;

use JSON;

my $text = do { local $/; <STDIN> };

my $json = JSON->new->canonical->pretty;
my $obj = $json->decode($text)
    or die $!;

# Datasource

$obj->{"__inputs"} = [
    {
        "name" => "DS_PROMETHEUS",
        "label"=> "prometheus",
        "description"=> "",
        "type"=> "datasource",
        "pluginId"=> "prometheus",
        "pluginName"=> "Prometheus"
    }
];

# Dashboard panels

@{$obj->{panels}} = grep {
    not ($_->{type} and $_->{type} eq 'prometheus-kubernetes-podnav-panel')
        and not ($_->{title} and $_->{title} eq 'Pod Filtering');
} @{$obj->{panels} || []};

map {
    if ($_->{datasource} and $_->{datasource} eq '$datasource') {
        $_->{datasource} = '${DS_PROMETHEUS}';
    }
} @{$obj->{panels} || []};

# Dashboard variables

@{$obj->{templating}{list}} = grep {
    my $v = $_;
    not $v->{name}
        or not grep { $v->{name} eq $_ } qw(ds datasource cluster);
} @{$obj->{templating}{list} || []};

map {
    if ($_->{name} and $_->{name} eq "namespace") {
        $_->{query} = "label_values(kube_pod_info, namespace)";
    }
    if ($_->{name} and $_->{name} eq "node") {
        $_->{query} = "label_values(kube_node_info, node)";
    }
    if ($_->{name} and $_->{name} eq "pod") {
        $_->{query} = "label_values(kube_pod_info{namespace=\"\$namespace\"}, pod)";
    }
    if ($_->{name} and $_->{name} eq "deployment") {
        $_->{query} = "label_values(kube_deployment_created{namespace=\"\$namespace\"}, deployment)";
    }
    if ($_->{datasource} and $_->{datasource} eq '$cluster') {
        $_->{datasource} = '${DS_PROMETHEUS}';
    }
} @{$obj->{templating}{list} || []};

# Dashboard requirements

@{$obj->{__requires}} = grep { $_->{id} ne "prometheus-kubernetes-podnav-panel" }
    @{$obj->{__requires} || []};

# Dashboard links

map {
    if ($_->{title} and $_->{title} eq "Dashboards") {
        $_->{title} = "K8s Dashboards";
        $_->{keepTime} = JSON::true;
        $_->{tags} = ["k8s"];
    }
} @{$obj->{links} || []};

# Dashboard tags

@{$obj->{tags}} = grep { $_ ne "kubernetes-app" } @{$obj->{tags} || []};
push @{$obj->{tags}}, "k8s";

print $json->encode($obj);
