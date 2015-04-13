Ceph Hands-On-Lab: [ibm.biz/ceph-hol][url]
==========================================
0. Interested in the slideshow? [Check out here](http://kmarc11.github.io/ibm-ceph-handson/)!

1. Go to the OpenStack dashboard for you personalized environment. Login using the username/password what you get from the instructors.

    [Dashboard](http://ceph-hol.open-test.ibmcloud.com/horizon/)

2. Find your **ceph-controller** machine's IP address:

    ![dashboard](https://raw.githubusercontent.com/Open-I-Beam/ceph-hands-on-lab/master/doc/dashboard.png)

3. To login to the virtual machines, download the ssh private key:

    | System  | Key file             |
    | ------- | -------------------- |
    | OpenSSH | [keys/id_rsa][1]     |
    | Putty   | [keys/id_rsa.ppk][2] |

4. SSH into the controller VM using the downloaded private key:

        chmod go-rwx id_rsa
        ssh -i id_rsa ubuntu@[ceph-controller-ip]

5. Clone this repository:

        git clone https://github.com/Open-I-Beam/ceph-hands-on-lab
        cd ceph-hands-on-lab/scripts
        mkdir temp
        cd temp

    This will be your working directory. Follow the instructions on the session.

    Happy Storage building! ;-)

[url]: http://ibm.biz/ceph-hol
[1]:https://raw.githubusercontent.com/Open-I-Beam/ceph-hands-on-lab/master/keys/id_rsa
[2]:https://raw.githubusercontent.com/Open-I-Beam/ceph-hands-on-lab/master/keys/id_rsa.ppk

