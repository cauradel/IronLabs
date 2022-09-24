#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Sep 17 13:42:16 2022

@author: manele
"""

import pandas as pd
import numpy as np
import matplotlib as plt
import matplotlib.pyplot as plt
import seaborn as sns
import random 
from random import sample

from yellowbrick.cluster import KElbowVisualizer
from sklearn.cluster import KMeans
import folium
from sklearn.cluster import AgglomerativeClustering
from sklearn.cluster import DBSCAN
from sklearn.metrics import silhouette_score
from sklearn.metrics import v_measure_score
from sklearn.metrics import silhouette_score, calinski_harabasz_score, davies_bouldin_score
from yellowbrick.cluster import KElbowVisualizer

import streamlit as st
from streamlit_folium import folium_static
import folium

####### Load Dataset #####################

uber = pd.read_csv('/Users/manele/Downloads/uber-raw-data-jul14.csv',header= 0,index_col= False)
uber_sample = uber.sample(n=None, frac=0.01, replace=False, weights=None, random_state=None, axis=None)


###### Seaborn Plot ######################

base = uber_sample['Base']
location = uber_sample['Lat']
date = uber_sample['Date/Time']
sns.displot(data=uber_sample, x=base, hue=None, height=12, palette="ch:.25")


######## Clustering #############

x = uber_sample[['Lat','Lon']]
kmeans = KMeans(n_clusters=7)
labels = kmeans.fit(x)
y_kmeans = kmeans.predict(x)

uber_sample['labels']= labels.labels_
centroids = kmeans.cluster_centers_
centroidss = pd.DataFrame(data = centroids, columns = [['Lat', 'Lon']])

####Ploting the centroids######
plt.scatter(centroidss['Lat'],centroidss['Lon'], marker = "x",  s = 200)
plt.show()


######Folium map#######
centroid = centroidss.values.tolist()

mapp = folium.Map(location=[40.7128, -74.0060], zoom_start=10,tiles = "openstreetmap")
for point in range(0, len(centroid)):
    folium.Marker(centroid[point], popup = centroid[point]).add_to(mapp)
    
folium_static(mapp)











































