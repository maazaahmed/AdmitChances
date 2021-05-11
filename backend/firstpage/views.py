from django.shortcuts import render
from django.http import HttpResponse
import pandas as pd
import os
# Create your views here.
def index(request, cgpa, rating, gre, tofel, sop, lor, research):
    import pandas as pd 
    df = pd.read_csv("/Users/mac/Downloads/ML AND DL/iOS Projects/AdmissionPrediction/backend/adm.csv")
    df.drop(['Serial No.'], axis=1,inplace=True)
    y = df['Chance of Admit ']
    df.drop(['Chance of Admit '], axis=1,inplace=True)
    x = df
    from sklearn.model_selection import train_test_split
    xtrain, xtest, ytrain, ytest = train_test_split(x,y,test_size=0.05, random_state=0)
    from sklearn.linear_model import LinearRegression 
    regressor = LinearRegression()
    regressor.fit(xtrain, ytrain)
    students = [{'GRE Score': gre,
              'TOEFL Score': tofel,
              'University Rating': rating,
               'SOP': sop,
                'LOR': lor,
                'CGPA': cgpa,
                'Research': research}
            ]

    df1 = pd.DataFrame(students)
    
    newAdmit = regressor.predict(df1)
   # directory = os.path.join("adm")
    #for root,dirs,files in os.walk(directory):
     #   for file in files:
      #      if file.endswith(".csv"):
       #         f=open(file, 'r')
                #  perform calculation
        #        f.close()
    #result = cgpa * rating
    result = newAdmit[0]
    return HttpResponse(f"Your admission chances is: {result}!")
