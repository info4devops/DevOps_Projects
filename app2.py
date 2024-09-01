# Monitoring Application: Final Version

import psutil
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def index():
    # Get CPU and Memory metrics
    cpu_percent = psutil.cpu_percent(interval=1)
    mem = psutil.virtual_memory()
    mem_percent = mem.percent

    # Check for high usage and set a message
    message = None
    if cpu_percent > 80 or mem_percent > 80:
        message = "High CPU or Memory Utilization detected. Please scale up!!!"

    # Render the template and pass metrics and the message
    return render_template("index2.html", cpuMetric=cpu_percent, memMetric=mem_percent, message=message)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
