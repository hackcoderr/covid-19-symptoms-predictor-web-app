from keras.models import load_model
from flask import Flask, render_template, request
import joblib
app = Flask("Covid-19-Symptom-Analysis")
model = joblib.load("covid-19.h5")
@app.route("/covid")
def home():
   return render_template("myform.html")

@app.route("/output", methods=[ "POST" ] )
def dia():
      x1 = request.form.get("z1")

      if x1=="yes":
          x1=1
      else:
          x1=0
      x2 = request.form.get("z2")
      if x2=="yes":
          x2=1
      else:
          x2=0
      x3 = request.form.get("z3")
      if x3=="yes":
          x3=1
      else:
          x3=0
      x4 = request.form.get("z4")
      if x4=="yes":
          x4=1
      else:
          x4=0
      x5 = request.form.get("z5")
      if x5=="yes":
          x5=1
      else:
          x5=0
      x6 = request.form.get("z6")
      if x6=="yes":
          x6=1
      else:
          x6=0
      x7 = request.form.get("z7")
      if x7=="yes":
          x7=1
      else:
          x7=0
      x8 = request.form.get("z8")
      if x8=="yes":
          x8=1
      else:
          x8=0
      x9 = request.form.get("z9")
      if x9=="yes":
          x9=1
      else:
          x9=0
      x10 = request.form.get("z10")
      if x10=="yes":
          x10=1
      else:
          x10=0

      output = model.predict([[ int(x1), int(x2),  int(x3), int(x4),  int(x5), int(x6),  int(x7), int(x8),  int(x9), int(x10)]])

      if str(round(output[0])) == "1":
         data="Covid Positive !!"
         return render_template("covid-positive-results.html", data=data)
      else:
          data="Covid Negative !!"
          return render_template("covid-nagative-results.html", data=data)
app.run(host="0.0.0.0", port=6666)