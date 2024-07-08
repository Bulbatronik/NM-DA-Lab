# Network Data Analysis Lab
This subdirectory contains the materials developed during the class with the small assignments. The files are separated by topics:
 - [Failure Management in Optical Networks + HW1](1-Failure-management-optical)
- [Traffic Prediction + HW2](2-Traffic-prediction)
- [QoS Estimation + HW3](3-QoT-estimation)
- [Failure Management in Microwave Networks](4-Failure-management-microwave)
- [Explainable AI in Telecommunications](5-Explainable-AI-in-telecom)


## 1) Failure Management in Optical Networks

The exercise is focused on two main problems in optical network traffic analysis: *Failure Idendtification* and *Cause Identification*. At first, the goal is to develop a binary classification pipeline to understand if the network is currently experiencing any malfunctions. Original labels are mapped the following way:

- A - No failures - 0
- B - Excessive attenuation - 1
- C - Extra filtering - 1

The whole pipeline is comprised of several tasks:
- **Task 1**. Raw data visualization
- **Task 2.** Dataset creation
- **Task 3.** Dataset loading
- **Task 4.** Hyperparameters optimization and model training
- **Task 5.** Testing and performance evaluation
- **Task 6.** Putting things together: Failure detection
- **Task 7** (*Homework*). Putting things together: Failure identification
- **Appendix.** Data visualization with PCA: motivates results for task 6-7

## Homework 1
In Task 7a, we focus on identifying the causes of failure in network communication. Similarly to the previous tasks, we focus on the binary classification while focusing on the failure labels (*B* and *C*).

While during the task of *Failure Idendtification* we managed to achieve a particularly good performance, the problem of *Cause Idendtification* was solved perfectly. This can be further validated in the **Appendix**, where we apply `Principle Component Analysis (PCA)` to the original dataset. After visualizing the first 2 components, we can see that linear separation boundary perfectly fits to separate class *B* and *C*

## 2) Traffic Prediction

In this session we focused on traffic prediction and cost evaluation predicted traffic by Multilayer Perceptron (MLP) and Long Short-Term Memory (LSTM) models. The cost evaluation help to optimize the resource allocation according to a given demand or constraints. In particular, apart from the conventional preprocessing and hyperparameter optimization, the key objective was to show that the key metric, such as `MSE` or `MAE`, might not be well-suited for the actual cost evaluation in practical cases.


The whole pipeline is comprised of several tasks:
- **Task 1.** Data visualization & pre-processing
- **Task 2.** MLP Dataset generation
- **Task 3.** MLP Training/test splitting
- **Task 4.** MLP model training and 
performance evaluation
- **Task 5.** LSTM Dataset generation
- **Task 6.** LSTM Training/test splitting
- **Task 7** LSTM model training and 
performance evaluation
- **Task 8** (*Homework*). Evaluate over/under-estimation cost

## Homework 2
First, the minimum and maximum traffic values are extracted from the previous tasks. The results with the ground truth are converted to CDR units after standardization.

Then we define the function `evaluate_cost()` to evaluate the cost of over/under-provisioning with parameters `alpha` and `beta`, which regulate the costs of over-/under-provisioning, respectively.

From the results we see that `LSTM` is lest provides better performance than the conventional `ANN`, although the `MSE` of both predictors are very similar. We provide a 3D visualization the costs for different values of `alpha` and `beta` for both predictors.

## 3) QoS Estimation in Optical Networks

In this scenorio we are required to estimate `Signal to Noise Ratio (SNR)` for the lightpaths routed in different network topologies. We analyze the correlation between the target and the features to select the optimal subset of features which we will use for model training. We compare `Linear Regrassion` with `Multilayer Perceptron` (`Adam` and `SGD` optimizers). We observe that just using one feature (*ligthpath length*), we are capable of achieving comparable performance to the original input. 

In the next step, we convert `SNR` to `Modulation Format (MF)` which will ensure no disturbances for each lightpath. We provide a similar experiment to evaluate the *margin* of the preductions and evaluate if the signal will be disrupted or not.

The whole pipeline is comprised of several tasks:
- **Task 1.** Raw data visualization
- **Task 2.** Dataset generation and visualization
- **Task 3.** ML algorithms training/testing
- **Task 4.** Evaluate the impact of using one single feature
performance evaluation
- **Task 5.** Evaluate the impact of inaccurate predictions
- **Task 6.** Performance evaluation
- **Task 7** (*Homework*). Evaluate the impact of uncertain fiber span length

## Homework 3
We define the function `extract_UNCERTAIN_features()` which introduces some random noise chosen from a normal distribution with a `μ=0`and `σ` configured by a user. This provides insights into how the uncertainty in the features affects the accuracy of the predictors and helps to evaluate the robustness of the model under noisy conditions.

## 4) Failure Management in Microwave Networks

The data is from several bidirectional links with each point being a 45-minutes windows (3 consecutive slots of 15 minutes) where the last slot unavailable for several seconds. The exercise, first, focuses on classification problem, where the objective is the identification of a failure using `RandomForestClassifier` and `KNeighborsClassifier`. 

We perform data preprocessing, including missing values imputation, noramalization and etc. We perform cross validation to identify the best hyperparameters for each of the models.


The second part is dedicated to clustering. In this case, the goal is to identify the subcategories of hardware failures. We apply `PCA` to the new truncated dataset. For clusterization `K-means` was applied with `Inertia` and `Silhouette` scores to identify the optimal number of clusters. We repeat the procedure for other types of failures such as extra-attenuation and self-interference.

The whole pipeline is comprised of several tasks:
- **Task 1.**  Data visualization & pre-processing
- **Task 2.** Dataset loading
- **Task 3.** Model training
- **Task 4.** Testing and performance evaluation
- **Task 5.** Analyze hardware failures using PCA
- **Task 6** Analyze extra-attenuation and self-interference failures

Tasks 1-4 focus on classification, while tasks 5-6 - clustering.


## 5) Explainable AI in Telecommunications

This section provides an example of `Explainable AI (XAI)` for interpretability of the acquired results. In our case we apply `Shapley-Additive Explanations (SHAP)` to fault identification in microwave links. To a domain expert. the results provided in the notebook are reasonable, which further validates the adequacy of our model.

The whole pipeline is comprised of several tasks:
- **Task 1.** Loading the dataset 
- **Task 2.** Model training
- **Task 3.** Visualize SHAP values 
- **Task 4** Analyze the model's reasoning
