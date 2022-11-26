# Computing Environment in RAGE's lab

### 1. Servers for computing purposes
We have two servers for performing various computing tasks. One server is meant to handle CPU-centric operations, while the other server is meant to 
handle GPU-centric operations. The details of both the servers are as follows:

|             | **CPU-server**                                                                 | **GPU-server**                                                                 |
|-------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| Name        | [skytree](https://www.gigabyte.com/jp/Enterprise/Rack-Server/R282-Z93-rev-115) | [khalifa](https://www.gigabyte.com/jp/Enterprise/Rack-Server/R282-Z94-rev-100) |
| CPU         | AMD EPYC 7542 32-Core Processor                                                | AMD EPYC 7452 32-Core Processor                                                |
| #NUMA nodes | 2                                                                              | 2                                                                              |
| #Cores      | 64 cores (128 virtual cores)                                                   | 64 cores (128 virtual cores)                                                   |
| RAM         | 400 GB of main memory                                                          | 64 GB of main memory                                                           |
| GPUs        | -                                                                              | NVidia's A6000 and Titan RTX                                                   |
| Storage     | NVME                                                                           | SSDs and Hard drivers                                                          |
| Capacity    | 8 TB of NVME                                                                   | 14 TB of SSDs   and 40 TB of HDDs                                              |
| Ipaddress   | 163.143.165.136                                                                | 163.143.165.137                                                                |


### 2. Server for storing big data using Hadoop
This server is only for performing Hadoop and Spark related operations. 

|             | **GPU-server**                                                                |
|-------------|-------------------------------------------------------------------------------|
| Name        | [Calima](https://www.gigabyte.com/jp/Enterprise/Rack-Server/R282-Z94-rev-100) |
| CPU         | AMD EPYC 7452 32-Core Processor                                               |
| #NUMA nodes | 2                                                                             |
| #Cores      | 64 cores (128 virtual cores)                                                  |
| RAM         | 64 GB of main memory                                                          |
| GPUs        | NVidia's 3090                                                                 |
| Storage     | Hard drivers                                                                  |
| Capacity    | 24 TB of HDDs                                                                 |
| Ipaddress   | 163.143.165.131                                                               |

