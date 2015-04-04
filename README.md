Ceph Hands-On-Lab public repository [bit.do/ibm-ceph][this]
===========================================================

1. Go to the OpenStack dashboard for you personalized environment:    

 [TBD][dashboard]

2. Find your **ceph-controller** machine's IP address:

    ![TBD](imgurl)

3. To login to the virtual machines, download the ssh private key:
 
    | System  | Key file                                                                                                  |
    | ------- | --------------------------------------------------------------------------------------------------------- |
    | OpenSSH | [keys/id_rsa](https://raw.githubusercontent.com/Open-I-Beam/ceph-hands-on-lab/master/keys/id_rsa)         |
    | Putty   | [keys/id_rsa.ppk](https://raw.githubusercontent.com/Open-I-Beam/ceph-hands-on-lab/master/keys/id_rsa.ppk) |

4. SSH into controller:  

        ssh -i id_rsa ubuntu@[ceph-controller-ip]

[this]: http://bit.do/ibm-ceph
[dashboard]: example.com
