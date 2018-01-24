# Terraform - Build a Kubernetes Cluster on Google Cloud Platform 

## Before you begin 

#### Install theses tools

### [gcloud](https://cloud.google.com/sdk/docs/quickstart-macos)
> 
>  On Mac 64 bit - We can use curl 
> ` curl -O  https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-184.0.0-darwin-x86_64.tar.gz
> `
> 
> Using gcloud we will install the below two compoments
> 
> **app-engine-python** ```gcloud components install app-engine-python```
> 
> **kubectl** ```gcloud components install app-engine-python```
> 

### Install Terraform
> ```curl -O https://releases.hashicorp.com/terraform/0.11.2/terraform_0.11.2_darwin_amd64.zip\?_ga\=2.187257576.1199271896.1516169701-677746182.1510952834```
> 

### Authentication JSON File
> 
> Authenticating with Google Cloud services requires a JSON file which we call the account file.
> 
> This file is downloaded directly from the Google Developers Console. To make the process more straightforwarded, it is documented here:
> 
1. Log into the Google Developers Console and select a project.
> 
1. The API Manager view should be selected, click on "Credentials" on the left, then "Create credentials", and finally "Service account key".
> 
1.  Select "Compute Engine default service account" in the "Service account" dropdown, and select "JSON" as the key type.
> 
1. Clicking "Create" will download your credentials.

### Commands used

### Terraform init 

```
# terraform init

Initializing provider plugins...
- Checking for available provider plugins on https://releases.hashicorp.com...
- Downloading plugin for provider "google" (1.4.0)...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.google: version = "~> 1.4"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

```
### terraform plan -out kube-gcp-state
```
terraform plan -out kube-gcp-state
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + google_container_cluster.gcp_kubernetes
      id:                                    <computed>
      additional_zones.#:                    "2"
      additional_zones.3926883567:           "us-west1-b"
      additional_zones.4078194094:           "us-west1-c"
      addons_config.#:                       <computed>
      cluster_ipv4_cidr:                     <computed>
      enable_kubernetes_alpha:               "false"
      enable_legacy_abac:                    "true"
      endpoint:                              <computed>
      initial_node_count:                    "1"
      instance_group_urls.#:                 <computed>
      logging_service:                       <computed>
      master_auth.#:                         "1"
      master_auth.0.client_certificate:      <computed>
      master_auth.0.client_key:              <computed>
      master_auth.0.cluster_ca_certificate:  <computed>
      master_auth.0.password:                <sensitive>
      master_auth.0.username:                "frankie"
      master_version:                        <computed>
      monitoring_service:                    <computed>
      name:                                  "ournewworld"
      network:                               "default"
      network_policy.#:                      <computed>
      node_config.#:                         "1"
      node_config.0.disk_size_gb:            <computed>
      node_config.0.image_type:              <computed>
      node_config.0.labels.%:                "1"
      node_config.0.labels.this-is-for:      "dev-cluster"
      node_config.0.local_ssd_count:         <computed>
      node_config.0.machine_type:            <computed>
      node_config.0.oauth_scopes.#:          "4"
      node_config.0.oauth_scopes.1277378754: "https://www.googleapis.com/auth/monitoring"
      node_config.0.oauth_scopes.1632638332: "https://www.googleapis.com/auth/devstorage.read_only"
      node_config.0.oauth_scopes.172152165:  "https://www.googleapis.com/auth/logging.write"
      node_config.0.oauth_scopes.299962681:  "https://www.googleapis.com/auth/compute"
      node_config.0.preemptible:             "false"
      node_config.0.service_account:         <computed>
      node_config.0.tags.#:                  "2"
      node_config.0.tags.0:                  "dev"
      node_config.0.tags.1:                  "work"
      node_pool.#:                           <computed>
      node_version:                          <computed>
      project:                               <computed>
      zone:                                  "us-west1-a"


Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: kube-gcp-state

To perform exactly these actions, run the following command to apply:
    terraform apply "kube-gcp-state"
    
    
```

### terraform apply "kube-gcp-state"

```
terraform apply 
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

gcp_cluster_endpoint = 35.199.187.35
gcp_cluster_name = ournewworld

gcp_ssh_command = ssh frankie@35.199.187.35

```

```
google_container_cluster.gcp_kubernetes: Creating...
  additional_zones.#:                    "" => "2"
  additional_zones.3926883567:           "" => "us-west1-b"
  additional_zones.4078194094:           "" => "us-west1-c"
  addons_config.#:                       "" => "<computed>"
  cluster_ipv4_cidr:                     "" => "<computed>"
  enable_kubernetes_alpha:               "" => "false"
  enable_legacy_abac:                    "" => "true"
  endpoint:                              "" => "<computed>"
  initial_node_count:                    "" => "1"
  instance_group_urls.#:                 "" => "<computed>"
  logging_service:                       "" => "<computed>"
  master_auth.#:                         "" => "1"
  master_auth.0.client_certificate:      "" => "<computed>"
  master_auth.0.client_key:              "<sensitive>" => "<sensitive>"
  master_auth.0.cluster_ca_certificate:  "" => "<computed>"
  master_auth.0.password:                "<sensitive>" => "<sensitive>"
  master_auth.0.username:                "" => "frankie"
  master_version:                        "" => "<computed>"
  monitoring_service:                    "" => "<computed>"
  name:                                  "" => "ournewworld"
  network:                               "" => "default"
  network_policy.#:                      "" => "<computed>"
  node_config.#:                         "" => "1"
  node_config.0.disk_size_gb:            "" => "<computed>"
  node_config.0.image_type:              "" => "<computed>"
  node_config.0.labels.%:                "" => "1"
  node_config.0.labels.this-is-for:      "" => "dev-cluster"
  node_config.0.local_ssd_count:         "" => "<computed>"
  node_config.0.machine_type:            "" => "<computed>"
  node_config.0.oauth_scopes.#:          "" => "4"
  node_config.0.oauth_scopes.1277378754: "" => "https://www.googleapis.com/auth/monitoring"
  node_config.0.oauth_scopes.1632638332: "" => "https://www.googleapis.com/auth/devstorage.read_only"
  node_config.0.oauth_scopes.172152165:  "" => "https://www.googleapis.com/auth/logging.write"
  node_config.0.oauth_scopes.299962681:  "" => "https://www.googleapis.com/auth/compute"
  node_config.0.preemptible:             "" => "false"
  node_config.0.service_account:         "" => "<computed>"
  node_config.0.tags.#:                  "" => "2"
  node_config.0.tags.0:                  "" => "dev"
  node_config.0.tags.1:                  "" => "work"
  node_pool.#:                           "" => "<computed>"
  node_version:                          "" => "<computed>"
  project:                               "" => "<computed>"
  zone:                                  "" => "us-west1-a"
google_container_cluster.gcp_kubernetes: Still creating... (10s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (20s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (30s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (40s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (50s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (1m0s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (1m10s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (1m20s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (1m30s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (1m40s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (1m50s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (2m0s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (2m10s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (2m20s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (2m30s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (2m40s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (2m50s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (3m0s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (3m10s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (3m20s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (3m30s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (3m40s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (3m50s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (4m0s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (4m10s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (4m20s elapsed)
google_container_cluster.gcp_kubernetes: Still creating... (4m30s elapsed)
google_container_cluster.gcp_kubernetes: Creation complete after 4m39s (ID: ournewworld)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

gcp_cluster_endpoint = 35.199.187.35
gcp_cluster_name = ournewworld
gcp_ssh_command = ssh frankie@35.199.187.35

```
### terraform -version 

```
➜  gcp-kube terraform -version
Terraform v0.11.2
+ provider.google v1.4.0
```
### terraform destroy

```
gcp-kube terraform destroy
google_container_cluster.gcp_kubernetes: Refreshing state... (ID: ournewworld)

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  - google_container_cluster.gcp_kubernetes


Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

google_container_cluster.gcp_kubernetes: Destroying... (ID: ournewworld)
google_container_cluster.gcp_kubernetes: Still destroying... (ID: ournewworld, 10s elapsed)
google_container_cluster.gcp_kubernetes: Still destroying... (ID: ournewworld, 20s elapsed)
google_container_cluster.gcp_kubernetes: Still destroying... (ID: ournewworld, 30s elapsed)
google_container_cluster.gcp_kubernetes: Still destroying... (ID: ournewworld, 40s elapsed)
google_container_cluster.gcp_kubernetes: Still destroying... (ID: ournewworld, 50s elapsed)
google_container_cluster.gcp_kubernetes: Still destroying... (ID: ournewworld, 1m0s elapsed)
google_container_cluster.gcp_kubernetes: Still destroying... (ID: ournewworld, 1m10s elapsed)
google_container_cluster.gcp_kubernetes: Destruction complete after 1m14s

Destroy complete! Resources: 1 destroyed.

```
### Reference 
[https://github.com/Adron/our_new_world](https://github.com/Adron/our_new_world)

[http://blog.adron.me/articles/terraform-kubernetes-gcp/
](http://blog.adron.me/articles/terraform-kubernetes-gcp/
)