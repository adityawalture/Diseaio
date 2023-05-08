from flask import Flask, jsonify, request
import pandas as pd
import numpy as np
import joblib
import traceback
from flask_restful import reqparse

app = Flask(__name__)

@app.route('/')
def home():
    return "hello"


@app.route('/predict',methods=['POST'])
def predict():
    model = joblib.load("model.joblib")
    shortness_of_breath = request.form.get('shortness of breath')
    dizziness = request.form.get('dizziness')
    asthenia = request.form.get('asthenia')
    fall = request.form.get('fall')
    syncope = request.form.get('syncope')
    vertigo = request.form.get('vertigo')
    sweat = request.form.get('sweat')
    vomiting = request.form.get('vomiting')
    nausea = request.form.get('nausea')
    chest_discomfort = request.form.get('chest discomfort')
    blackout = request.form.get('blackout')
    sneeze = request.form.get('sneeze')
    cough = request.form.get('cough')
    fever = request.form.get('fever')

    input_query = np.array([[shortness_of_breath,dizziness,asthenia,fall,syncope]])

    result = model.predict(input_query)[0]

    return jsonify({'disease':str(result)})       
   
if __name__ == '__main__':
    app.run(debug=True)