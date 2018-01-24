provider "google" {
  credentials = "${file("/Users/donsantmajor/.gcp/don-kube-c6bdb7737cb1.json")}"
  project     = "don-kube"
  region      = "australia-southeast1"
}