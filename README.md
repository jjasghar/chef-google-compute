# Google Compute Engine Chef Cookbook

This cookbook provides the built-in types and services for Chef to manage
Google Cloud Compute resources, as native Chef types.


## Requirements

### Platforms

#### Supported Operating Systems

This cookbook was tested on the following operating systems:

* RedHat 6, 7
* CentOS 6, 7
* Debian 7, 8
* Ubuntu 12.04, 14.04, 16.04, 16.10
* SLES 11-sp4, 12-sp2
* openSUSE 13
* Windows Server 2008 R2, 2012 R2, 2012 R2 Core, 2016 R2, 2016 R2 Core

## Example

```ruby
# TODO(alexstephen): Add example here

```

## Credentials

All Google Cloud Platform cookbooks use an unified authentication mechanism,
provided by the `google-gauth` cookbook. Don't worry, it is automatically
installed when you install this module.

### Example

```ruby
gauth_credential 'mycred' do
  action :serviceaccount
  path ENV['CRED_PATH'] # e.g. '/path/to/my_account.json'
  scopes [
    'https://www.googleapis.com/auth/compute'
  ]
end

```

TODO(nelsonjr): Add location here once auth module is published:
For complete details about the credential cookbook please visit ________

## Resources

* [`gcompute_address`](#gcompute_address) -
    Represents an Address resource.
    Each virtual machine instance has an ephemeral internal IP address and,
    optionally, an external IP address. To communicate between instances on
    the same network, you can use an instance's internal IP address. To
    communicate with the Internet and instances outside of the same
    network,
    you must specify the instance's external IP address.
    Internal IP addresses are ephemeral and only belong to an instance for
    the lifetime of the instance; if the instance is deleted and recreated,
    the instance is assigned a new internal IP address, either by Compute
    Engine or by you. External IP addresses can be either ephemeral or
    static.
* [`gcompute_backend_bucket`](#gcompute_backend_bucket) -
    Backend buckets allow you to use Google Cloud Storage buckets with
    HTTP(S)
    load balancing.
    An HTTP(S) load balancing can direct traffic to specified URLs to a
    backend bucket rather than a backend service. It can send requests for
    static content to a Cloud Storage bucket and requests for dynamic
    content
    a virtual machine instance.
* [`gcompute_disk_type`](#gcompute_disk_type) -
    Represents a DiskType resource. A DiskType resource represents the type
    of disk to use, such as a pd-ssd or pd-standard. To reference a disk
    type, use the disk type's full or partial URL.
* [`gcompute_disk`](#gcompute_disk) -
    Persistent disks are durable storage devices that function similarly to
    the physical disks in a desktop or a server. Compute Engine manages the
    hardware behind these devices to ensure data redundancy and optimize
    performance for you. Persistent disks are available as either standard
    hard disk drives (HDD) or solid-state drives (SSD).
    Persistent disks are located independently from your virtual machine
    instances, so you can detach or move persistent disks to keep your data
    even after you delete your instances. Persistent disk performance
    scales
    automatically with size, so you can resize your existing persistent
    disks
    or add more persistent disks to an instance to meet your performance
    and
    storage space requirements.
    Add a persistent disk to your instance when you need reliable and
    affordable storage with consistent performance characteristics.
* [`gcompute_firewall`](#gcompute_firewall) -
    Each network has its own firewall controlling access to and from the
    instances.
    All traffic to instances, even from other instances, is blocked by the
    firewall unless firewall rules are created to allow it.
    The default network has automatically created firewall rules that are
    shown in default firewall rules. No manually created network has
    automatically created firewall rules except for a default "allow" rule
    for
    outgoing traffic and a default "deny" for incoming traffic. For all
    networks except the default network, you must create any firewall rules
    you need.
* [`gcompute_global_address`](#gcompute_global_address) -
    Represents a Global Address resource. Global addresses are used for
    HTTP(S) load balancing.
* [`gcompute_http_health_check`](#gcompute_http_health_check) -
    An HttpHealthCheck resource. This resource defines a template for how
    individual VMs should be checked for health, via HTTP.
* [`gcompute_https_health_check`](#gcompute_https_health_check) -
    An HttpsHealthCheck resource. This resource defines a template for how
    individual VMs should be checked for health, via HTTPS.
* [`gcompute_health_check`](#gcompute_health_check) -
    An HealthCheck resource. This resource defines a template for how
    individual virtual machines should be checked for health, via one of
    the supported protocols.
* [`gcompute_license`](#gcompute_license) -
    A License resource represents a software license. Licenses are used to
    track software usage in images, persistent disks, snapshots, and
    virtual
    machine instances.
* [`gcompute_instance`](#gcompute_instance) -
    An instance is a virtual machine (VM) hosted on Google's
    infrastructure.
* [`gcompute_instance_group`](#gcompute_instance_group) -
    Represents an Instance Group resource. Instance groups are self-managed
    and can contain identical or different instances. Instance groups do
    not
    use an instance template. Unlike managed instance groups, you must
    create
    and add instances to an instance group manually.
* [`gcompute_network`](#gcompute_network) -
    Represents a Network resource.
    Your Cloud Platform Console project can contain multiple networks, and
    each network can have multiple instances attached to it. A network
    allows
    you to define a gateway IP and the network range for the instances
    attached to that network. Every project is provided with a default
    network
    with preset configurations and firewall rules. You can choose to
    customize
    the default network by adding or removing rules, or you can create new
    networks in that project. Generally, most users only need one network,
    although you can have up to five networks per project by default.
    A network belongs to only one project, and each instance can only
    belong
    to one network. All Compute Engine networks use the IPv4 protocol.
    Compute
    Engine currently does not support IPv6. However, Google is a major
    advocate of IPv6 and it is an important future direction.
* [`gcompute_region`](#gcompute_region) -
    Represents a Region resource. A region is a specific geographical
    location where you can run your resources. Each region has one or more
    zones
* [`gcompute_route`](#gcompute_route) -
    Represents a Route resource.
    A route is a rule that specifies how certain packets should be handled
    by
    the virtual network. Routes are associated with virtual machines by
    tag,
    and the set of routes for a particular virtual machine is called its
    routing table. For each packet leaving a virtual machine, the system
    searches that virtual machine's routing table for a single best
    matching
    route.
    Routes match packets by destination IP address, preferring smaller or
    more
    specific ranges over larger ones. If there is a tie, the system selects
    the route with the smallest priority value. If there is still a tie, it
    uses the layer three and four packet headers to select just one of the
    remaining matching routes. The packet is then forwarded as specified by
    the next_hop field of the winning route -- either to another virtual
    machine destination, a virtual machine gateway or a Compute
    Engine-operated gateway. Packets that do not match any route in the
    sending virtual machine's routing table will be dropped.
    A Routes resources must have exactly one specification of either
    nextHopGateway, nextHopInstance, nextHopIp, or nextHopVpnTunnel.
* [`gcompute_ssl_certificate`](#gcompute_ssl_certificate) -
    An SslCertificate resource. This resource provides a mechanism to
    upload
    an SSL key and certificate to the load balancer to serve secure
    connections from the user.
* [`gcompute_subnetwork`](#gcompute_subnetwork) -
    A VPC network is a virtual version of the traditional physical networks
    that exist within and between physical data centers. A VPC network
    provides connectivity for your Compute Engine virtual machine (VM)
    instances, Container Engine containers, App Engine Flex services, and
    other network-related resources.
    Each GCP project contains one or more VPC networks. Each VPC network is
    a
    global entity spanning all GCP regions. This global VPC network allows
    VM
    instances and other resources to communicate with each other via
    internal,
    private IP addresses.
    Each VPC network is subdivided into subnets, and each subnet is
    contained
    within a single region. You can have more than one subnet in a region
    for
    a given VPC network. Each subnet has a contiguous private RFC1918 IP
    space. You create instances, containers, and the like in these subnets.
    When you create an instance, you must create it in a subnet, and the
    instance draws its internal IP address from that subnet.
    Virtual machine (VM) instances in a VPC network can communicate with
    instances in all other subnets of the same VPC network, regardless of
    region, using their RFC1918 private IP addresses. You can isolate
    portions
    of the network, even entire subnets, using firewall rules.


### gcompute_address
Represents an Address resource.

Each virtual machine instance has an ephemeral internal IP address and,
optionally, an external IP address. To communicate between instances on
the same network, you can use an instance's internal IP address. To
communicate with the Internet and instances outside of the same network,
you must specify the instance's external IP address.

Internal IP addresses are ephemeral and only belong to an instance for
the lifetime of the instance; if the instance is deleted and recreated,
the instance is assigned a new internal IP address, either by Compute
Engine or by you. External IP addresses can be either ephemeral or
static.


#### Example

```ruby
gcompute_region 'some-region' do
  action :create
  r_label 'us-west1'
  project 'google.com:graphite-playground'
  credential 'mycred'
end

gcompute_address 'test1' do
  action :create
  region 'some-region'
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_address` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_address` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `address` -
  The static external IP address represented by this
  resource. Only IPv4 is supported.
* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `description` -
  An optional description of this resource.
* `id` -
  The unique identifier for the resource.
* `name` -
  Name of the resource.
* `users` -
  The URLs of the resources that are using this address.
* `region` -
  A reference to Region resource

#### Label
Set the `a_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_backend_bucket
Backend buckets allow you to use Google Cloud Storage buckets with HTTP(S)
load balancing.

An HTTP(S) load balancing can direct traffic to specified URLs to a
backend bucket rather than a backend service. It can send requests for
static content to a Cloud Storage bucket and requests for dynamic content
a virtual machine instance.


#### Example

```ruby
# *** WARNING ***
# TODO(nelsonjr): http://b/63088154 Google Cloud Platform API is returning
# access denied if we use a more restricted scope such as
# https://www.googleapis.com/auth/compute. For the time being use an all mighty
# scope instead: https://www.googleapis.com/auth/cloud-platform.

gcompute_backend_bucket 'be-bucket-connection' do
  action :create
  bucket_name 'backend-bucket-test'
  description 'A BackendBucket to connect LNB w/ Storage Bucket'
  enable_cdn true
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_backend_bucket` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_backend_bucket` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `bucket_name` -
  Cloud Storage bucket name.
* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `description` -
  An optional textual description of the resource; provided by the
  client when the resource is created.
* `enable_cdn` -
  If true, enable Cloud CDN for this BackendBucket.
* `id` -
  Unique identifier for the resource.
* `name` -
  Name of the resource. Provided by the client when the resource is
  created. The name must be 1-63 characters long, and comply with
  RFC1035.  Specifically, the name must be 1-63 characters long and
  match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means
  the first character must be a lowercase letter, and all following
  characters must be a dash, lowercase letter, or digit, except the
  last character, which cannot be a dash.

#### Label
Set the `bb_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_disk_type
Represents a DiskType resource. A DiskType resource represents the type
of disk to use, such as a pd-ssd or pd-standard. To reference a disk
type, use the disk type's full or partial URL.


#### Example

```ruby
gcompute_disk_type 'pd-standard' do
  action :create
  default_disk_size_gb 500
  zone 'us-central1-a'
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_disk_type` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_disk_type` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `default_disk_size_gb` -
  Server-defined default disk size in GB.
* `deprecated_deleted` -
  An optional RFC3339 timestamp on or after which the deprecation state
  of this resource will be changed to DELETED.
* `deprecated_deprecated` -
  An optional RFC3339 timestamp on or after which the deprecation state
  of this resource will be changed to DEPRECATED.
* `deprecated_obsolete` -
  An optional RFC3339 timestamp on or after which the deprecation state
  of this resource will be changed to OBSOLETE.
* `deprecated_replacement` -
  The URL of the suggested replacement for a deprecated resource. The
  suggested replacement resource must be the same kind of resource as
  the deprecated resource.
* `deprecated_state` -
  The deprecation state of this resource. This can be DEPRECATED,
  OBSOLETE, or DELETED. Operations which create a new resource using a
  DEPRECATED resource will return successfully, but with a warning
  indicating the deprecated resource and recommending its replacement.
  Operations which use OBSOLETE or DELETED resources will be rejected
  and result in an error.
* `description` -
  An optional description of this resource.
* `id` -
  The unique identifier for the resource.
* `name` -
  Name of the resource.
* `valid_disk_size` -
  An optional textual description of the valid disk size, such as
  "10GB-10TB".
* `zone` -
  URL of the zone where the disk type resides.

#### Label
Set the `dt_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_disk
Persistent disks are durable storage devices that function similarly to
the physical disks in a desktop or a server. Compute Engine manages the
hardware behind these devices to ensure data redundancy and optimize
performance for you. Persistent disks are available as either standard
hard disk drives (HDD) or solid-state drives (SSD).

Persistent disks are located independently from your virtual machine
instances, so you can detach or move persistent disks to keep your data
even after you delete your instances. Persistent disk performance scales
automatically with size, so you can resize your existing persistent disks
or add more persistent disks to an instance to meet your performance and
storage space requirements.

Add a persistent disk to your instance when you need reliable and
affordable storage with consistent performance characteristics.


#### Example

```ruby
# TODO(alexstephen): Add example here

```

#### Actions

* `create` -
  Converges the `gcompute_disk` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_disk` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `description` -
  An optional description of this resource. Provide this property when
  you create the resource.
* `id` -
  The unique identifier for the resource.
* `last_attach_timestamp` -
  Last attach timestamp in RFC3339 text format.
* `last_detach_timestamp` -
  Last dettach timestamp in RFC3339 text format.
* `licenses` -
  Any applicable publicly visible licenses.
* `name` -
  Name of the resource. Provided by the client when the resource is
  created. The name must be 1-63 characters long, and comply with
  RFC1035. Specifically, the name must be 1-63 characters long and match
  the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the
  first character must be a lowercase letter, and all following
  characters must be a dash, lowercase letter, or digit, except the last
  character, which cannot be a dash.
* `size_gb` -
  Size of the persistent disk, specified in GB. You can specify this
  field when creating a persistent disk using the sourceImage or
  sourceSnapshot parameter, or specify it alone to create an empty
  persistent disk.
  If you specify this field along with sourceImage or sourceSnapshot,
  the value of sizeGb must not be less than the size of the sourceImage
  or the size of the snapshot.
* `source_image` -
  The source image used to create this disk. If the source image is
  deleted, this field will not be set.
  To create a disk with one of the public operating system images,
  specify the image by its family name. For example, specify
  family/debian-8 to use the latest Debian 8 image:
  projects/debian-cloud/global/images/family/debian-8
  Alternatively, use a specific version of a public operating system
  image:
  projects/debian-cloud/global/images/debian-8-jessie-vYYYYMMDD
  To create a disk with a private image that you created, specify the
  image name in the following format:
  global/images/my-private-image
  You can also specify a private image by its image family, which
  returns the latest version of the image in that family. Replace the
  image name with family/family-name:
  global/images/family/my-private-family
* `type` -
  URL of the disk type resource describing which disk type to use to
  create the disk. Provide this when creating the disk.
* `users` -
  Links to the users of the disk (attached instances) in form:
  project/zones/zone/instances/instance
* `zone` -
  URL of the zone where the autoscaler resides.
* `disk_encryption_key` -
  Encrypts the disk using a customer-supplied encryption key.
  After you encrypt a disk with a customer-supplied key, you must
  provide the same key if you use the disk later (e.g. to create a disk
  snapshot or an image, or to attach the disk to a virtual machine).
  Customer-supplied encryption keys do not protect access to metadata of
  the disk.
  If you do not provide an encryption key when creating the disk, then
  the disk will be encrypted using an automatically generated key and
  you do not need to provide a key to use the disk later.
* `source_image_encryption_key` -
  The customer-supplied encryption key of the source image. Required if
  the source image is protected by a customer-supplied encryption key.
* `source_image_id` -
  The ID value of the image used to create this disk. This value
  identifies the exact image that was used to create this persistent
  disk. For example, if you created the persistent disk from an image
  that was later deleted and recreated under the same name, the source
  image ID would identify the exact version of the image that was used.
* `source_snapshot` -
  The source snapshot used to create this disk. You can provide this as
  a partial or full URL to the resource. For example, the following are
  valid values:
  * https://www.googleapis.com/compute/v1/projects/project/global/
  snapshots/snapshot
  * projects/project/global/snapshots/snapshot
  * global/snapshots/snapshot
* `source_snapshot_encryption_key` -
  The customer-supplied encryption key of the source snapshot. Required
  if the source snapshot is protected by a customer-supplied encryption
  key.
* `source_snapshot_id` -
  The unique ID of the snapshot used to create this disk. This value
  identifies the exact snapshot that was used to create this persistent
  disk. For example, if you created the persistent disk from a snapshot
  that was later deleted and recreated under the same name, the source
  snapshot ID would identify the exact version of the snapshot that was
  used.

#### Label
Set the `d_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_firewall
Each network has its own firewall controlling access to and from the
instances.

All traffic to instances, even from other instances, is blocked by the
firewall unless firewall rules are created to allow it.

The default network has automatically created firewall rules that are
shown in default firewall rules. No manually created network has
automatically created firewall rules except for a default "allow" rule for
outgoing traffic and a default "deny" for incoming traffic. For all
networks except the default network, you must create any firewall rules
you need.


#### Example

```ruby
# TODO(alexstephen): Add example here

```

#### Actions

* `create` -
  Converges the `gcompute_firewall` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_firewall` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `allowed` -
  The list of ALLOW rules specified by this firewall. Each rule
  specifies a protocol and port-range tuple that describes a permitted
  connection.
* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `description` -
  An optional description of this resource. Provide this property when
  you create the resource.
* `id` -
  The unique identifier for the resource.
* `name` -
  Name of the resource. Provided by the client when the resource is
  created. The name must be 1-63 characters long, and comply with
  RFC1035. Specifically, the name must be 1-63 characters long and match
  the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the
  first character must be a lowercase letter, and all following
  characters must be a dash, lowercase letter, or digit, except the last
  character, which cannot be a dash.
* `network` -
  URL of the network resource for this firewall rule. If not specified
  when creating a firewall rule, the default network is used:
  global/networks/default
  If you choose to specify this property, you can specify the network as
  a full or partial URL. For example, the following are all valid URLs:
  https://www.googleapis.com/compute/v1/projects/myproject/global/
  networks/my-network
  projects/myproject/global/networks/my-network
  global/networks/default
* `source_ranges` -
  If source ranges are specified, the firewall will apply only to
  traffic that has source IP address in these ranges. These ranges must
  be expressed in CIDR format. One or both of sourceRanges and
  sourceTags may be set. If both properties are set, the firewall will
  apply to traffic that has source IP address within sourceRanges OR the
  source IP that belongs to a tag listed in the sourceTags property. The
  connection does not need to match both properties for the firewall to
  apply. Only IPv4 is supported.
* `source_tags` -
  If source tags are specified, the firewall will apply only to traffic
  with source IP that belongs to a tag listed in source tags. Source
  tags cannot be used to control traffic to an instance's external IP
  address. Because tags are associated with an instance, not an IP
  address. One or both of sourceRanges and sourceTags may be set. If
  both properties are set, the firewall will apply to traffic that has
  source IP address within sourceRanges OR the source IP that belongs to
  a tag listed in the sourceTags property. The connection does not need
  to match both properties for the firewall to apply.
* `target_tags` -
  A list of instance tags indicating sets of instances located in the
  network that may make network connections as specified in allowed[].
  If no targetTags are specified, the firewall rule applies to all
  instances on the specified network.

#### Label
Set the `f_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_global_address
Represents a Global Address resource. Global addresses are used for
HTTP(S) load balancing.


#### Example

```ruby
gcompute_global_address 'chef-my-app-loadbalancer' do
  action :create
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_global_address` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_global_address` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `address` -
  The static external IP address represented by this resource.
* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `description` -
  An optional description of this resource.
  Provide this property when you create the resource.
* `id` -
  The unique identifier for the resource. This identifier is defined by
  the server.
* `name` -
  Name of the resource. Provided by the client when the resource is
  created. The name must be 1-63 characters long, and comply with
  RFC1035.  Specifically, the name must be 1-63 characters long and
  match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means
  the first character must be a lowercase letter, and all following
  characters must be a dash, lowercase letter, or digit, except the last
  character, which cannot be a dash.
* `region` -
  URL of the region where the regional address resides. This field is
  not applicable to global addresses.

#### Label
Set the `ga_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_http_health_check
An HttpHealthCheck resource. This resource defines a template for how
individual VMs should be checked for health, via HTTP.


#### Example

```ruby
gcompute_http_health_check 'app-health-check' do
  action :create
  hhc_label 'my-app-http-hc'
  healthy_threshold 10
  port 8080
  timeout_sec 2
  unhealthy_threshold 5
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_http_health_check` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_http_health_check` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `check_interval_sec` -
  How often (in seconds) to send a health check. The default value is 5
  seconds.
* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `description` -
  An optional description of this resource. Provide this property when
  you create the resource.
* `healthy_threshold` -
  A so-far unhealthy instance will be marked healthy after this many
  consecutive successes. The default value is 2.
* `host` -
  The value of the host header in the HTTP health check request. If
  left empty (default value), the public IP on behalf of which this
  health check is performed will be used.
* `id` -
  The unique identifier for the resource. This identifier is defined by
  the server.
* `name` -
  Name of the resource. Provided by the client when the resource is
  created. The name must be 1-63 characters long, and comply with
  RFC1035.  Specifically, the name must be 1-63 characters long and
  match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means
  the first character must be a lowercase letter, and all following
  characters must be a dash, lowercase letter, or digit, except the
  last character, which cannot be a dash.
* `port` -
  The TCP port number for the HTTP health check request.
  The default value is 80.
* `request_path` -
  The request path of the HTTP health check request.
  The default value is /.
* `timeout_sec` -
  How long (in seconds) to wait before claiming failure.
  The default value is 5 seconds.  It is invalid for timeoutSec to have
  greater value than checkIntervalSec.
* `unhealthy_threshold` -
  A so-far healthy instance will be marked unhealthy after this many
  consecutive failures. The default value is 2.

#### Label
Set the `hhc_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_https_health_check
An HttpsHealthCheck resource. This resource defines a template for how
individual VMs should be checked for health, via HTTPS.


#### Example

```ruby
gcompute_https_health_check 'app-health-check' do
  action :create
  hhc_label 'my-app-https-hc'
  healthy_threshold 10
  port 8080
  timeout_sec 2
  unhealthy_threshold 5
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_https_health_check` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_https_health_check` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `check_interval_sec` -
  How often (in seconds) to send a health check. The default value is 5
  seconds.
* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `description` -
  An optional description of this resource. Provide this property when
  you create the resource.
* `healthy_threshold` -
  A so-far unhealthy instance will be marked healthy after this many
  consecutive successes. The default value is 2.
* `host` -
  The value of the host header in the HTTPS health check request. If
  left empty (default value), the public IP on behalf of which this
  health check is performed will be used.
* `id` -
  The unique identifier for the resource. This identifier is defined by
  the server.
* `name` -
  Name of the resource. Provided by the client when the resource is
  created. The name must be 1-63 characters long, and comply with
  RFC1035.  Specifically, the name must be 1-63 characters long and
  match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means
  the first character must be a lowercase letter, and all following
  characters must be a dash, lowercase letter, or digit, except the
  last character, which cannot be a dash.
* `port` -
  The TCP port number for the HTTPS health check request.
  The default value is 80.
* `request_path` -
  The request path of the HTTPS health check request.
  The default value is /.
* `timeout_sec` -
  How long (in seconds) to wait before claiming failure.
  The default value is 5 seconds.  It is invalid for timeoutSec to have
  greater value than checkIntervalSec.
* `unhealthy_threshold` -
  A so-far healthy instance will be marked unhealthy after this many
  consecutive failures. The default value is 2.

#### Label
Set the `hhc_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_health_check
An HealthCheck resource. This resource defines a template for how individual virtual machines should be checked for health, via one of the supported protocols.

#### Example

```ruby
# TODO(alexstephen): Add example here

```

#### Actions

* `create` -
  Converges the `gcompute_health_check` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_health_check` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `check_interval_sec` -
  How often (in seconds) to send a health check. The default value is 5
  seconds.
* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `description` -
  An optional description of this resource. Provide this property when
  you create the resource.
* `healthy_threshold` -
  A so-far unhealthy instance will be marked healthy after this many
  consecutive successes. The default value is 2.
* `id` -
  The unique identifier for the resource. This identifier is defined by
  the server.
* `name` -
  Name of the resource. Provided by the client when the resource is
  created. The name must be 1-63 characters long, and comply with
  RFC1035.  Specifically, the name must be 1-63 characters long and
  match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means
  the first character must be a lowercase letter, and all following
  characters must be a dash, lowercase letter, or digit, except the
  last character, which cannot be a dash.
* `timeout_sec` -
  How long (in seconds) to wait before claiming failure.
  The default value is 5 seconds.  It is invalid for timeoutSec to have
  greater value than checkIntervalSec.
* `unhealthy_threshold` -
  A so-far healthy instance will be marked unhealthy after this many
  consecutive failures. The default value is 2.
* `type` -
  Specifies the type of the healthCheck, either TCP, SSL, HTTP or
  HTTPS. If not specified, the default is TCP. Exactly one of the
  protocol-specific health check field must be specified, which must
  match type field.
* `http_health_check` -
  A nested object resource
* `https_health_check` -
  A nested object resource
* `tcp_health_check` -
  A nested object resource
* `ssl_health_check` -
  A nested object resource

#### Label
Set the `hc_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_license
A License resource represents a software license. Licenses are used to
track software usage in images, persistent disks, snapshots, and virtual
machine instances.


#### Example

```ruby
gcompute_license 'test-license' do
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_license` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_license` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `name` -
  Name of the resource. The name is 1-63 characters long
  and complies with RFC1035.
* `charges_use_fee` -
  If true, the customer will be charged license fee for
  running software that contains this license on an instance.

#### Label
Set the `l_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_instance
An instance is a virtual machine (VM) hosted on Google's infrastructure.


#### Example

```ruby
# Tip: Remember to define gsql_disk to match the 'disk' property.
# Tip: Remember to define gsql_network to match the 'network' property.
gcompute_instance 'instance-test' do
  action :create
  machine_type ['https://www.googleapis.com/compute/v1/projects/',
                'google.com:graphite-playground/zones/us-central1-a/',
                'machineTypes/n1-standard-1'].join
  disks [
    {
      boot   => true,
      source => 'data-disk-1'
    }
  ]
  network_interfaces [
    {
      network => 'mynetwork-test'
    }
  ]
  zone 'us-central1-a'
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_instance` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_instance` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `can_ip_forward` -
  Allows this instance to send and receive packets with non-matching
  destination or source IPs. This is required if you plan to use this
  instance to forward routes.
* `cpu_platform` -
  The CPU platform used by this instance.
* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `disks` -
  Persistent disks are durable storage devices that function similarly
  to the physical disks in a desktop or a server. Compute Engine manages
  the hardware behind these devices to ensure data redundancy and
  optimize performance for you. Persistent disks are available as either
  standard hard disk drives (HDD) or solid-state drives (SSD).
* `guest_accelerators` -
  List of the type and count of accelerator cards attached to the
  instance
* `id` -
  The unique identifier for the resource. This identifier is defined by
  the server.
* `label_fingerprint` -
  A fingerprint for this request, which is essentially a hash of the
  metadata's contents and used for optimistic locking. The fingerprint
  is initially generated by Compute Engine and changes after every
  request to modify or update metadata. You must always provide an
  up-to-date fingerprint hash in order to update or change metadata.
* `machine_type` -
  Full or partial URL of the machine type resource to use
  for this instance, in the format:
  zones/zone/machineTypes/machine-type. This is provided by the client
  when the instance is created.
* `min_cpu_platform` -
  Specifies a minimum CPU platform for the VM instance. Applicable
  values are the friendly names of CPU platforms
* `name` -
  The name of the resource, provided by the client when initially
  creating the resource. The resource name must be 1-63 characters long,
  and comply with RFC1035. Specifically, the name must be 1-63
  characters long and match the regular expression
  [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a
  lowercase letter, and all following characters must be a dash,
  lowercase letter, or digit, except the last character, which cannot
  be a dash.
* `network_interfaces` -
  An array of configurations for this interface. This specifies how this
  interface is configured to interact with other network services, such
  as connecting to the internet. Only one network interface is supported
  per instance.
* `scheduling` -
  Sets the scheduling options for this instance.
* `service_accounts` -
  A list of service accounts, with their specified scopes, authorized
  for this instance. Only one service account per VM instance is
  supported.
* `status` -
  The status of the instance. One of the following values:
  PROVISIONING, STAGING, RUNNING, STOPPING, SUSPENDING, SUSPENDED,
  and TERMINATED.
* `status_message` -
  An optional, human-readable explanation of the status.
* `tags` -
  A list of tags to apply to this instance. Tags are used to identify
  valid sources or targets for network firewalls and are specified by
  the client during instance creation. The tags can be later modified
  by the setTags method. Each tag within the list must comply with
  RFC1035.
* `zone` -
  URL of the zone where the disk type resides.

#### Label
Set the `i_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_instance_group
Represents an Instance Group resource. Instance groups are self-managed
and can contain identical or different instances. Instance groups do not
use an instance template. Unlike managed instance groups, you must create
and add instances to an instance group manually.


#### Example

```ruby
# Instance group requires a network and a region, so define them in your recipe:
#   - gcompute_network 'my-network' do ... end
gcompute_instance_group 'my-puppet-masters' do
  action :create
  named_ports [
    {
      name: 'puppet',
      port: 8140
    }
  ]
  network 'my-network'
  zone 'us-central1-a'
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_instance_group` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_instance_group` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `description` -
  An optional description of this resource. Provide this property when
  you create the resource.
* `id` -
  A unique identifier for this instance group.
* `name` -
  The name of the instance group.
  The name must be 1-63 characters long, and comply with RFC1035.
* `named_ports` -
  Assigns a name to a port number.
  For example: {name: "http", port: 80}.
  This allows the system to reference ports by the assigned name
  instead of a port number. Named ports can also contain multiple
  ports.
  For example: [{name: "http", port: 80},{name: "http", port: 8080}]
  Named ports apply to all instances in this instance group.
* `network` -
  A reference to Network resource
* `region` -
  A reference to Region resource
* `subnetwork` -
  A reference to Subnetwork resource
* `zone` -
  URL of the zone where the autoscaler resides.

#### Label
Set the `ig_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_network
Represents a Network resource.

Your Cloud Platform Console project can contain multiple networks, and
each network can have multiple instances attached to it. A network allows
you to define a gateway IP and the network range for the instances
attached to that network. Every project is provided with a default network
with preset configurations and firewall rules. You can choose to customize
the default network by adding or removing rules, or you can create new
networks in that project. Generally, most users only need one network,
although you can have up to five networks per project by default.

A network belongs to only one project, and each instance can only belong
to one network. All Compute Engine networks use the IPv4 protocol. Compute
Engine currently does not support IPv6. However, Google is a major
advocate of IPv6 and it is an important future direction.


#### Example

```ruby
gcompute_network "mynetwork" do
  action :create
  auto_create_subnetworks true
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_network` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_network` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `description` -
  An optional description of this resource. Provide this property when
  you create the resource.
* `gateway_ipv4` -
  A gateway address for default routing to other networks. This value is
  read only and is selected by the Google Compute Engine, typically as
  the first usable address in the IPv4Range.
* `id` -
  The unique identifier for the resource.
* `ipv4_range` -
  The range of internal addresses that are legal on this network. This
  range is a CIDR specification, for example: 192.168.0.0/16. Provided
  by the client when the network is created.
* `name` -
  Name of the resource. Provided by the client when the resource is
  created. The name must be 1-63 characters long, and comply with
  RFC1035. Specifically, the name must be 1-63 characters long and match
  the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the
  first character must be a lowercase letter, and all following
  characters must be a dash, lowercase letter, or digit, except the last
  character, which cannot be a dash.
* `subnetworks` -
  Server-defined fully-qualified URLs for all subnetworks in this
  network.
* `auto_create_subnetworks` -
  When set to true, the network is created in "auto subnet mode". When
  set to false, the network is in "custom subnet mode".
  In "auto subnet mode", a newly created network is assigned the default
  CIDR of 10.128.0.0/9 and it automatically creates one subnetwork per
  region.
* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.

#### Label
Set the `n_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_region
Represents a Region resource. A region is a specific geographical
location where you can run your resources. Each region has one or more
zones


#### Example

```ruby
gcompute_region 'us-west1' do
  action :create
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_region` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_region` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `deprecated_deleted` -
  An optional RFC3339 timestamp on or after which the deprecation state
  of this resource will be changed to DELETED.
* `deprecated_deprecated` -
  An optional RFC3339 timestamp on or after which the deprecation state
  of this resource will be changed to DEPRECATED.
* `deprecated_obsolete` -
  An optional RFC3339 timestamp on or after which the deprecation state
  of this resource will be changed to OBSOLETE.
* `deprecated_replacement` -
  The URL of the suggested replacement for a deprecated resource. The
  suggested replacement resource must be the same kind of resource as
  the deprecated resource.
* `deprecated_state` -
  The deprecation state of this resource. This can be DEPRECATED,
  OBSOLETE, or DELETED. Operations which create a new resource using a
  DEPRECATED resource will return successfully, but with a warning
  indicating the deprecated resource and recommending its replacement.
  Operations which use OBSOLETE or DELETED resources will be rejected
  and result in an error.
* `description` -
  An optional description of this resource.
* `id` -
  The unique identifier for the resource.
* `name` -
  Name of the resource.
* `zones` -
  List of zones within the region

#### Label
Set the `r_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_route
Represents a Route resource.

A route is a rule that specifies how certain packets should be handled by
the virtual network. Routes are associated with virtual machines by tag,
and the set of routes for a particular virtual machine is called its
routing table. For each packet leaving a virtual machine, the system
searches that virtual machine's routing table for a single best matching
route.

Routes match packets by destination IP address, preferring smaller or more
specific ranges over larger ones. If there is a tie, the system selects
the route with the smallest priority value. If there is still a tie, it
uses the layer three and four packet headers to select just one of the
remaining matching routes. The packet is then forwarded as specified by
the next_hop field of the winning route -- either to another virtual
machine destination, a virtual machine gateway or a Compute
Engine-operated gateway. Packets that do not match any route in the
sending virtual machine's routing table will be dropped.

A Routes resources must have exactly one specification of either
nextHopGateway, nextHopInstance, nextHopIp, or nextHopVpnTunnel.


#### Example

```ruby
# Subnetwork requires a network and a region, so define them in your recipe:
#   - gcompute_network 'my-network' do ... end
#   - gcompute_region 'some-region' do ... end
gcompute_route 'corp-route' do
  action :create
  dest_range '192.168.6.0/24'
  next_hop_gateway 'global/gateways/default-internet-gateway'
  tags %w[backends databases] # %w[] best for single words. use ['.'] w/ spaces
  network 'my-network'
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_route` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_route` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `dest_range` -
  The destination range of outgoing packets that this route applies to.
  Only IPv4 is supported.
* `name` -
  Name of the resource. Provided by the client when the resource is
  created. The name must be 1-63 characters long, and comply with
  RFC1035.  Specifically, the name must be 1-63 characters long and
  match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means
  the first character must be a lowercase letter, and all following
  characters must be a dash, lowercase letter, or digit, except the
  last character, which cannot be a dash.
* `network` -
  A reference to Network resource
* `priority` -
  The priority of this route. Priority is used to break ties in cases
  where there is more than one matching route of equal prefix length.
  In the case of two routes with equal prefix length, the one with the
  lowest-numbered priority value wins.
  Default value is 1000. Valid range is 0 through 65535.
* `tags` -
  A list of instance tags to which this route applies.
* `next_hop_gateway` -
  URL to a gateway that should handle matching packets.
  Currently, you can only specify the internet gateway, using a full or
  partial valid URL:
  * https://www.googleapis.com/compute/v1/projects/project/
  global/gateways/default-internet-gateway
  * projects/project/global/gateways/default-internet-gateway
  * global/gateways/default-internet-gateway
* `next_hop_instance` -
  URL to an instance that should handle matching packets.
  You can specify this as a full or partial URL. For example:
  * https://www.googleapis.com/compute/v1/projects/project/zones/zone/
  instances/instance
  * projects/project/zones/zone/instances/instance
  * zones/zone/instances/instance
* `next_hop_ip` -
  Network IP address of an instance that should handle matching packets.
* `next_hop_vpn_tunnel` -
  URL to a VpnTunnel that should handle matching packets.

#### Label
Set the `r_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_ssl_certificate
An SslCertificate resource. This resource provides a mechanism to upload
an SSL key and certificate to the load balancer to serve secure
connections from the user.


#### Example

```ruby
# *******
# WARNING: This recipe is for example purposes only. It is *not* advisable to
# have the key embedded like this because if you check this file into source
# control you are publishing the private key to whomever can access the source
# code.
# *******

gcompute_ssl_certificate 'my-site-ssl-certificate' do
  action :create
  certificate(
    <<-CERTIFICATE
       -----BEGIN CERTIFICATE-----
       MIICqjCCAk+gAwIBAgIJAIuJ+0352Kq4MAoGCCqGSM49BAMCMIGwMQswCQYDVQQG
       EwJVUzETMBEGA1UECAwKV2FzaGluZ3RvbjERMA8GA1UEBwwIS2lya2xhbmQxFTAT
       BgNVBAoMDEdvb2dsZSwgSW5jLjEeMBwGA1UECwwVR29vZ2xlIENsb3VkIFBsYXRm
       b3JtMR8wHQYDVQQDDBZ3d3cubXktc2VjdXJlLXNpdGUuY29tMSEwHwYJKoZIhvcN
       AQkBFhJuZWxzb25hQGdvb2dsZS5jb20wHhcNMTcwNjI4MDQ1NjI2WhcNMjcwNjI2
       MDQ1NjI2WjCBsDELMAkGA1UEBhMCVVMxEzARBgNVBAgMCldhc2hpbmd0b24xETAP
       BgNVBAcMCEtpcmtsYW5kMRUwEwYDVQQKDAxHb29nbGUsIEluYy4xHjAcBgNVBAsM
       FUdvb2dsZSBDbG91ZCBQbGF0Zm9ybTEfMB0GA1UEAwwWd3d3Lm15LXNlY3VyZS1z
       aXRlLmNvbTEhMB8GCSqGSIb3DQEJARYSbmVsc29uYUBnb29nbGUuY29tMFkwEwYH
       KoZIzj0CAQYIKoZIzj0DAQcDQgAEHGzpcRJ4XzfBJCCPMQeXQpTXwlblimODQCuQ
       4mzkzTv0dXyB750fOGN02HtkpBOZzzvUARTR10JQoSe2/5PIwaNQME4wHQYDVR0O
       BBYEFKIQC3A2SDpxcdfn0YLKineDNq/BMB8GA1UdIwQYMBaAFKIQC3A2SDpxcdfn
       0YLKineDNq/BMAwGA1UdEwQFMAMBAf8wCgYIKoZIzj0EAwIDSQAwRgIhALs4vy+O
       M3jcqgA4fSW/oKw6UJxp+M6a+nGMX+UJR3YgAiEAvvl39QRVAiv84hdoCuyON0lJ
       zqGNhIPGq2ULqXKK8BY=
       -----END CERTIFICATE-----
       CERTIFICATE
  ).split("\n").map(&:strip).join("\n")
  private_key(
    <<-PRIVATE_KEY
       -----BEGIN EC PRIVATE KEY-----
       MHcCAQEEIObtRo8tkUqoMjeHhsOh2ouPpXCgBcP+EDxZCB/tws15oAoGCCqGSM49
       AwEHoUQDQgAEHGzpcRJ4XzfBJCCPMQeXQpTXwlblimODQCuQ4mzkzTv0dXyB750f
       OGN02HtkpBOZzzvUARTR10JQoSe2/5PIwQ==
       -----END EC PRIVATE KEY-----
       PRIVATE_KEY
  ).split("\n").map(&:strip).join("\n")
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_ssl_certificate` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_ssl_certificate` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `certificate` -
  The certificate in PEM format.
  The certificate chain must be no greater than 5 certs long.
  The chain must include at least one intermediate cert.
* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `description` -
  An optional description of this resource.
* `id` -
  The unique identifier for the resource.
* `name` -
  Name of the resource. Provided by the client when the resource is
  created. The name must be 1-63 characters long, and comply with
  RFC1035. Specifically, the name must be 1-63 characters long and match
  the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the
  first character must be a lowercase letter, and all following
  characters must be a dash, lowercase letter, or digit, except the last
  character, which cannot be a dash.
* `private_key` -
  The private key in PEM format.

#### Label
Set the `sc_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### gcompute_subnetwork
A VPC network is a virtual version of the traditional physical networks
that exist within and between physical data centers. A VPC network
provides connectivity for your Compute Engine virtual machine (VM)
instances, Container Engine containers, App Engine Flex services, and
other network-related resources.

Each GCP project contains one or more VPC networks. Each VPC network is a
global entity spanning all GCP regions. This global VPC network allows VM
instances and other resources to communicate with each other via internal,
private IP addresses.

Each VPC network is subdivided into subnets, and each subnet is contained
within a single region. You can have more than one subnet in a region for
a given VPC network. Each subnet has a contiguous private RFC1918 IP
space. You create instances, containers, and the like in these subnets.
When you create an instance, you must create it in a subnet, and the
instance draws its internal IP address from that subnet.

Virtual machine (VM) instances in a VPC network can communicate with
instances in all other subnets of the same VPC network, regardless of
region, using their RFC1918 private IP addresses. You can isolate portions
of the network, even entire subnets, using firewall rules.


#### Example

```ruby
# Subnetwork requires a network and a region, so define them in your recipe:
#   - gcompute_network 'my-network' do ... end
#   - gcompute_region 'some-region' do ... end
gcompute_subnetwork 'servers' do
  action :create
  ip_cidr_range '172.16.0.0/16'
  network 'my-network'
  region 'some-region'
  project 'google.com:graphite-playground'
  credential 'mycred'
end

```

#### Actions

* `create` -
  Converges the `gcompute_subnetwork` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `gcompute_subnetwork` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `creation_timestamp` -
  Creation timestamp in RFC3339 text format.
* `description` -
  An optional description of this resource. Provide this property when
  you create the resource. This field can be set only at resource
  creation time.
* `gateway_address` -
  The gateway address for default routes to reach destination addresses
  outside this subnetwork. This field can be set only at resource
  creation time.
* `id` -
  The unique identifier for the resource.
* `ip_cidr_range` -
  The range of internal addresses that are owned by this subnetwork.
  Provide this property when you create the subnetwork. For example,
  10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and
  non-overlapping within a network. Only IPv4 is supported.
* `name` -
  The name of the resource, provided by the client when initially
  creating the resource. The name must be 1-63 characters long, and
  comply with RFC1035. Specifically, the name must be 1-63 characters
  long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which
  means the first character must be a lowercase letter, and all
  following characters must be a dash, lowercase letter, or digit,
  except the last character, which cannot be a dash.
* `network` -
  A reference to Network resource
* `private_ip_google_access` -
  Whether the VMs in this subnet can access Google services without
  assigned external IP addresses.
* `region` -
  A reference to Region resource

#### Label
Set the `s_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"
