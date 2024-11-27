from flask import Flask, request, render_template
import joblib
import pandas as pd

# Initialize Flask app
app = Flask(__name__)

# Load the pre-trained model and vectorizer
model = joblib.load('Feedback.pkl')
vectorizer = joblib.load('vectorizer.pkl')

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    # Get the text input from the form
    input_text = request.form['text']

    # Check if the input text is empty
    if not input_text.strip():
        return render_template('index.html', prediction_text="Please enter some feedback text.")

    # Preprocess and vectorize the input text
    input_vectorized = vectorizer.transform([input_text])

    # Make prediction using the loaded model
    prediction = model.predict(input_vectorized)

    # Return the result
    return render_template('index.html', prediction_text=f'Predicted Sentiment: {prediction[0]}')

if __name__ == "__main__":
    app.run(debug=True)
