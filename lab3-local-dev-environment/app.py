# Import the socket module to get information about the host system
import socket

# Import Flask, a micro web framework for building web applications
from flask import Flask

# Create an instance of the Flask class (the web app)
app = Flask(__name__)

# Define a route for the root URL ('/')
@app.route('/')
def hello():
    # Get the hostname of the machine where this server is running
    hostname = socket.gethostname()
    # Return a response string showing which instance is handling the request
    return 'instance running on {}\n'.format(hostname)

