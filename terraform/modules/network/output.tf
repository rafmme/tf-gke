output "tembea-vpc-network-name" {
  value = "${google_compute_network.tembea-vpc-network.self_link}"
}

output "tembea-private-subnet-name" {
  value = "${google_compute_subnetwork.tembea-private-subnet.self_link}"
}

output "tembea-public-subnet-name" {
  value = "${google_compute_subnetwork.tembea-public-subnet.self_link}"
}



