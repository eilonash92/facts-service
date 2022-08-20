from flask import Flask, render_template
import requests
import json

app = Flask(__name__)


@app.route('/')
def showRandomFact():
    response = requests.get("https://uselessfacts.jsph.pl/random.json?language=en")
    random_fact = json.loads(response.content)["text"]
    return render_template('index.html', random_fact = random_fact)