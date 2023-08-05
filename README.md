# Group 1



## Introduction

This project is about the classification of normal walk and silly walk. We utilized the GRU (Gated Recurrent Unit) algorithm and implemented it using MATLAB

## Requirements
The codes are tested in the following environment:
- Matlab(2022b)
- Machine Learning Toolbox

## Installation
- Clone this repository.
  
  ```
  git clone https://gitlab.lrz.de/ldv/teaching/monty-matlab/montymatlab2023/group-1.git
  ```
## Datasets


## Training
The accuracy rate is almost 97%.
If you cannnot reproduce the results, remember to run it multiple times.

  ```
model=train(fullfile(pwd,'TrainingData'),50,3.4)
  ```

## Testing

  ```
Accuracy = classify(fullfile(pwd,'TestData'),'Model.mat',50,3.4)
  ```

## Run graphically（test）
1. run 'GUI' command in Matlab Command Window and configure parameters
2. choose *Pre trained model* to select 'Model.mat'
3. klick button *Choose test folder* and choose the testdata
4. klick *Test* to start, then the Accuracy should be showed.
5. choose *Graphic*  to obtain the Graphic of testdata.
6. choose *Results* to obtain the results of classification

## Run graphically（training）
1. klick button *Choose training folder* and choose the trainingdata
2. klick *Train*: The training process of the model will be displayed, including dynamic display plots of changes in accuracy and loss.
3. choose the test folder and klick *Test*

## Attention
If the accuracy results are not expected, please delete the Model.mat file, redo the training process described above, and test the data again.

<!-- ## Demo video
Demo video of this project: [YouTube](the link of the video) -->


## Acknowledgement
This project is not possible without multiple great works.
- [ ] [matlab-lstm](https://www.mathworks.com/help/deeplearning/ug/long-short-term-memory-networks.html).
- [ ] [matlab-gru](https://www.mathworks.com/help/deeplearning/ref/dlarray.gru.html).

<!-- 
## Run graphically（test）
1. run 'GUI' command in Matlab Command Window and configure parameters
2. choose *Pre trained model* to select 'Model.mat'
3. klick button *Choose test folder* and choose the testdata
4. klick *Test* to start, then the Accuracy should be showed.
5. choose *Graphic*  to obtain the Graphic of testdata.
6. choose *Results* to obtain the results of classification

## Run graphically（training）
1. klick button *Choose training folder* and choose the trainingdata
2. klick *Train*: The training process of the model will be displayed, including dynamic display plots of changes in accuracy and loss.
3. choose the test folder and klick *Test* -->

## Attention
If the accuracy results are not expected, please delete the Model.mat file, redo the training process described above, and test the data again.
