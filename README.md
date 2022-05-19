# Customer-Segmentation

## About


Customer segmentation is the process of dividing customers into groups based on common characteristics so companies can market to each group effectively and appropriately.



## Context and Problem Statement


You are owning a supermarket mall and through membership cards , you have some basic data about your customers like Customer ID, age, gender, annual income and spending score. Spending Score is something you assign to the customer based on your defined parameters like customer behavior and purchasing data. You want to segment the customers into different clusters so that you can efficiently target the customers in order to generate more sales.


## Dataset Used 


The Dataset used for this project is the <a href="https://www.kaggle.com/datasets/vjchoudhary7/customer-segmentation-tutorial-in-python">Mall Customers</a> Dataset. This dataset has 5 different features. The feartures and their short descirption is mentioned in the table below:


   | Column Name     |   Description    |
 |    :----:   |          :-: |
 | Customer ID      | A Unique Identification Feature assigned to each customer  |
| Gender        |   Customers are classified on the basis of their genders viz. Male and Female   |
 | Age |  Customers are classified on the basis of their Age |
 | Annual Income | This Feature illustrates the Annual Income of Customers in Thousands |
 | Spending Score | This is a feature in which a special spending score is assinged to each customer based on his/her buying behaviour and net spend |
 
 
 ## Flow of the Project
 
 <img src="Picture1.png"
     alt="Flowchart" />
 
 
 

## Algorithm Used 

<a href="https://en.wikipedia.org/wiki/K-means_clustering">K-means Clustering</a> is one of the simplest and popular unsupervised machine learning algorithms.
Typically, unsupervised algorithms make inferences from datasets using only input vectors without referring to known, or labelled, outcomes.
The objective of K-means is simple: group similar data points together and discover underlying patterns. To achieve this objective, K-means looks for a fixed number (k) of clusters in a dataset.
A cluster refers to a collection of data points aggregated together because of certain similarities.
You’ll define a target number k, which refers to the number of centroids you need in the dataset. A centroid is the imaginary or real location representing the center of the cluster.
Every data point is allocated to each of the clusters through reducing the in-cluster sum of squares.
In other words, the K-means algorithm identifies k number of centroids, and then allocates every data point to the nearest cluster, while keeping the centroids as small as possible.
The ‘means’ in the K-means refers to averaging of the data; that is, finding the centroid.


## Future Scope


The Future Scope of this project will be to built a user friendly web interface using the <a href="https://shiny.rstudio.com/">Shiny Package</a> offered by R Studio. With the help of Shiny we can create really nice looking interfaces for our R project.
