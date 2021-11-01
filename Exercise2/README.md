# Readme

## 2.1 Write a network scanner

The workflow of the script is as follows: 
- Scan the target using nmap and output it to a file 
- While true: 
  - Scan the target again and output it into a new file
  - Then compare the two files using diff
  - Delete the first file ("scan1.txt"), and rename the second file to "scan1.txt"

The script "scanner" imports __os__, __sys__ and __subprocess__ in order to execute underlying OS commands and binaries, such as nmap and diff. The script runs nmap with the arguments:
1) sys.argv\[1] by which the IP address is passed to the script via the command line
2) -sT for running a TCP connect scan 
3) -p- for running the scan on all ports
4) -T4 for running the scan faster

The subprocess.run() function is used to run nmap and to capture the output into the scanoutput variable. The contents of the variable (the scan output) is then written to a file "scan1.txt". In order to continuously scan the target, a "while True" statement is used, in which the target is scanned again, and the output is written to a file "scan2.txt". To print the differences between the files, the OS command diff is used, and only the differentiating rows (the rows which contain the character ">") are printed. The script proceeds to remove the file "scan1.txt" and rename "scan2.txt" to "scan1.txt". 

Following improvements can be implemented in the script: 
- Output sanitation on lines 9 and 15 (as noted in the comments) 
- Input validation for the IP address/network range


![Exercise_2 1](https://user-images.githubusercontent.com/36381123/139752761-5e9a827f-6c13-413d-a35e-0a2ce1ddec9c.png)


## 2.2 Kubernetize and deploy the scanner

Built the docker image using the provided Dockerfile. The container is built from Python's Alpine Linux container due to resource conservation, and the packet manager's cache had been cleared out to use less disk space. The dockerfile instructs Docker to copy the scanner script to the home directory, install nmap and sets the entrypoint of the container to the script that's being executed by the Python interpreter. 

![Exercise_2 2_pt1](https://user-images.githubusercontent.com/36381123/139753599-d2fdced2-7097-4bdb-ab61-68efff120fba.png)


Wrote a scanner.yml Kubernetes manifest that runs the image periodically every 5 minutes as a cronjob. Installed minikube and applied the manifest. 

![Exercise_2 2_pt2](https://user-images.githubusercontent.com/36381123/139753478-0b26a85a-ce17-4a06-9d1a-03381bb5327b.png)
