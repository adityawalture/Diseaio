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

@app.route('/predict', methods=['POST'])
def predict():
    model = joblib.load("new_model.joblib")
    # model = joblib.load("flask_backend/new_model.joblib")
    # model = joblib.load("flask_backend/new_model.joblib")
    shortness_of_breath = request.form.get('shortness of breath')
    dizziness = request.form.get('dizziness')
    asthenia = request.form.get('asthenia')
    fall = request.form.get('fall')
    syncope = request.form.get('syncope')
    vertigo = request.form.get('vertigo')
    sweat = request.form.get('sweat')
    sweat_increased = request.form.get('sweating increased')
    palpitation = request.form.get('palpitation')
    nausea = request.form.get('nausea')
    angina_pectoris = request.form.get('angina pectoris')
    pressure_chest = request.form.get('pressure chest')
    polyuria = request.form.get('polyuria')
    polydypsia = request.form.get('polydypsia')
    pain_chest = request.form.get('pain chest')
    orthopnea = request.form.get('orthopnea')
    rale = request.form.get('rale')
    unresponsiveness = request.form.get('unresponsiveness')
    mental_status_changes = request.form.get('mental status changes')
    vomiting = request.form.get('vomiting')
    labored_breathing = request.form.get('labored breathing')
    feeling_suicidal = request.form.get('feeling suicidal')
    suicidal = request.form.get('suicidal')
    hallucinations_auditory = request.form.get('hallucinations auditory')
    feeling_hopeless = request.form.get('feeling hopeless')

    input_query = np.array([[shortness_of_breath, dizziness,asthenia,fall,syncope,vertigo,sweat,sweat_increased,palpitation,nausea,angina_pectoris,pressure_chest,polyuria,polydypsia,pain_chest,orthopnea,rale,unresponsiveness,mental_status_changes,vomiting,labored_breathing,feeling_suicidal,suicidal,hallucinations_auditory,feeling_hopeless]])

    result = model.predict(input_query)[0]

    return jsonify({'disease':str(result)})

if __name__ == '__main__':
    app.run(debug=True)