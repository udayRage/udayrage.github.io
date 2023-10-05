# Computing Environment in RAGE's lab

### 1. Physical servers
We have two servers for performing various computing tasks. One server is meant to handle CPU-centric operations, while the other server is meant to 
handle GPU-centric operations. The details of both the servers are as follows:

|             | **CPU-server**                                                                 | **GPU-server**                                                                 |
|-------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| Name        | [skytree](https://www.gigabyte.com/jp/Enterprise/Rack-Server/R282-Z93-rev-115) | [khalifa](https://www.gigabyte.com/jp/Enterprise/Rack-Server/R282-Z94-rev-100) |
| CPU         | AMD EPYC 7542 32-Core Processor                                                | AMD EPYC 7452 32-Core Processor                                                |
| #NUMA nodes | 2                                                                              | 2                                                                              |
| #Cores      | 64 cores (128 virtual cores)                                                   | 64 cores (128 virtual cores)                                                   |
| RAM         | 400 GB of main memory                                                          | 200 GB of main memory                                                          |
| GPUs        | -                                                                              | two NVidia's A6000 and Titan RTX                                               |
| Storage     | NVME                                                                           | SSDs and Hard drivers                                                          |
| Capacity    | 8 TB of NVME                                                                   | 14 TB of SSDs   and 40 TB of HDDs                                              |
| Ipaddress   | 163.143.165.136                                                                | 163.143.165.137                                                                |


[//]: # (### 2. Server for storing big data using Hadoop)

[//]: # (This server is only for performing Hadoop and Spark related operations. )

[//]: # ()
[//]: # (|             | **GPU-server**                                                                |)

[//]: # (|-------------|-------------------------------------------------------------------------------|)

[//]: # (| Name        | [Calima]&#40;https://www.gigabyte.com/jp/Enterprise/Rack-Server/R282-Z94-rev-100&#41; |)

[//]: # (| CPU         | AMD EPYC 7452 32-Core Processor                                               |)

[//]: # (| #NUMA nodes | 2                                                                             |)

[//]: # (| #Cores      | 64 cores &#40;128 virtual cores&#41;                                                  |)

[//]: # (| RAM         | 64 GB of main memory                                                          |)

[//]: # (| GPUs        | NVidia's 3090                                                                 |)

[//]: # (| Storage     | Hard drivers                                                                  |)

[//]: # (| Capacity    | 24 TB of HDDs                                                                 |)

[//]: # (| Ipaddress   | 163.143.165.131                                                               |)

[//]: # ()

### 2. Virtual machines for computing purposes

1. skytree1.u-aizu.ac.jp (Only CPU)
        
        163.143.165.136
        

2. skytree1.u-aizu.ac.jp (Only CPU)

        163.143.165.141
    
3. khalifa1.u-aizu.ac.jp (CPU + GPU)

        163.143.165.137

4. khalifa2.u-aizu.ac.jp (CPU + GPU)

        163.143.165.138

5. khalifa3.u-aizu.ac.jp (CPU + GPU)

        163.143.165.140