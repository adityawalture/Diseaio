from flask import Flask, jsonify, request
import pandas as pd
import numpy as np
import joblib
import traceback
from flask_restful import reqparse

app = Flask(__name__)



@app.route('/predict',methods=['POST'])
def predict():
    model = joblib.load('./models/model.joblib')
    shortness_of_breath = request.form.get('shortness of breath')
    dizziness = request.form.get('dizziness')
    asthenia = request.form.get('asthenia')
    fall = request.form.get('fall')
    syncope = request.form.get('syncope')
<<<<<<< HEAD
    vertigo=request.form.get('vertigo')
    sweat=request.form.get('sweat')
    sweating_increased=request.form.get('sweating increased')
    palpitation=request.form.get('palpitation')
    nausea=request.form.get('nausea')
    angina_pectoris=request.form.get('angina pectoris')
    pressure_chest=request.form.get('pressure chest')
    polyuria=request.form.get('polyuria')
    polydypsia=request.form.get('polydypsia')
    pain_chest=request.form.get('pain chest')   
=======
    vertigo = request.form.get('vertigo')
    sweat = request.form.get('sweat')
    vomiting = request.form.get('vomiting')
    nausea = request.form.get('nausea')
    chest_discomfort = request.form.get('chest discomfort')
    blackout = request.form.get('blackout')
    sneeze = request.form.get('sneeze')
    cough = request.form.get('cough')
    fever = request.form.get('fever')
>>>>>>> 92aacbf656bf6065a1ab54dd04317d650111e247

    input_query = np.array([[shortness_of_breath,dizziness,asthenia,fall,syncope,vertigo,sweat,sweating_increased,palpitation,nausea,
                             angina_pectoris,pressure_chest,polyuria,polydypsia,pain_chest]])

    # input_query= np.array([[shortness_of_breath,dizziness,asthenia,fall,syncope]])   #for 5 symptoms
    result = model.predict(input_query)[0]

    return jsonify({'disease':str(result)})       
   
if __name__ == '__main__':
    app.run(debug=True)