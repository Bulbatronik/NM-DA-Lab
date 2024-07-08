# Anomaly Detection in Optical Transponders (NDA Lab)

## Overview

This project aims to detect anomalies in optical transponder signals by analyzing constellation diagrams, focusing on 16QAM constellations at the receiver of the Channel Under Test (CUT). Faulty lasers can cause higher signal power and frequency drift, leading to interference with neighboring channels and degrading network performance. The goal is to classify signals as normal or faulty based on the characteristics of interferers with varying powers and distances from the CUT. More details on the on the project requirements and deliverables are available in `Project.pdf`.

## Datasets
The dataset is originally sourced from [here](https://ieee-dataport.org/open-access/constellation-diagrams-spectrum-anomaly-detection-optical-networks). It contains images of the 16QAM constellation at the receiver of the Channel Under Test (CUT), annotated with 5 classes for normal and faulty signal conditions.
In the project we consider two types of input images:

1. Constellation diagrams of the 16QAM receiver at the Channel Under Test (CUT).
2. One-Symbol in the 16QAM constellation.

The datasets are split into training and testing sets for model training and evaluation, respectively.It should be noted the training set contains only normal samples. Custom cross-validation is performed to assess the model's generalization performance and to avoid overfitting (more info in the presentation pdf)

## Algorithms

The following algorithms are utilized for anomaly detection:

- One-Class Support Vector Machine (SVM)
- Isolation Forest
- PCA: applied to reduce the dimensionality of the dataset while preserving its important features.

## Extra
### Transfer Learning

Transfer learning techniques are explored to improve the detection of anomalies in optical transponder signals.

 **1. Pure TL:**  

We performed training and hyperparameter tuning on the domain *A*, evaluated the model on a test set containing images from domain *B*

 **2- Domain adaptation:**

a) We performed training and hyperparameter tuning on the domain *A*.

b) In each step, the model is re-trained using batches of 10 images from the domain *B* (16steps).

c) We evaluate the resulting models on a test set of unseen images belong to domain *B*.

### Covariance Feature Space

An alternative approach based on covariance feature space is considered for anomaly detection and demonstrated in `anomaly_detection-cov_feat.ipynb`.
- extract statistical features (Mean, Variance, skewness and Kurtosis) of images along the column, in both spatial and Fourier domain.
- Create a new feature space based on the covariance matrix of each feature vector of each image and check the sparebility of this new feature space 
- PCA
- Training both models on the covariance feature space (with and without PCA)

### Explainable Artificial Intelligence (XAI): GradCAM

Considering the problem as a classification task, a DNN model is used to classify faulty and normal samples. Then, GradCAM is used to visualize the regions of an image that are important for a its prediction.

## Conclusion

The project concludes with a summary of findings, insights, and potential areas for future research in optical transponder signal anomaly detection. The main results are available in `anomaly_detection-main.ipynb`. All the detailed results are provided in `Report.pdf` file.