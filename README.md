# De1-SOC-Salt-and-Pepper-noise

This project focuses on the implementation of the median filtering algorithm using
FPGA. In the process of digital image processing, noise, especially interference noise
and salt-and-pepper noise, is inevitable. The presence of noise severely affects the
results of image processing, particularly in edge detection algorithms. The median
filtering algorithm is a non-linear smoothing algorithm based on the theory of
statistical ranking. It can effectively smooth noise and has a good filtering effect on
salt-and-pepper noise, while preserving the edge information of the image. Therefore, it is widely used in edge extraction in digital image processing.
![before](https://github.com/OliverQueen1466/Storage_Image/blob/main/sallt_pepper/before.png#pic_left=100*20)
![before](https://github.com/OliverQueen1466/Storage_Image/blob/main/sallt_pepper/afterr.png#pic_right=100*20)
## Getting Started

These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes. See deployment
for notes on deploying the project on a live system.

### Prerequisites

Requirements for the software and other tools to build, test and push 
- Altera DE1-SOC develop board 
- Quartus II/Matlab/Python3.5
- [OpenCV](https://opencv.org/)

### Installing

Linux: 

    git clone https://github.com/OliverQueen1466/DE1-SOC-Salt-and-Pepper-noise.git

## Running the project

Explain how to run the automated tests for this system

### Step 1: Generate picture with salt-pepper noise

Open addpeppersalt.m in Matlab file 


### Step 2：Convert the .bmp file to .txt file

This step is done in python through OpenCV library

### Step 3: Input .txt to verilog

Testbench is also included for function verifivation before using the real board.

### Step 4: Download to the board 



## Acknowledgments

  - Prof. Wang from FPGA honor class provides the Altera DE1-SOC develop board
