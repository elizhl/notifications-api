from flask import Flask, url_for
from flask import request, render_template
from markupsafe import escape
import uuid
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import json

app = Flask(__name__)

@app.route('/health', methods=['POST'])
def health_check():
	return {"success": True}

@app.route('/send-notification', methods=['POST'])
def send_email():
    info = request.form
    email = info.get("email", "")
    folio = str(uuid.uuid4()).split("-")[0]
    
    me = "consultraining.eli@gmail.com"
    my_password = "Nothing."
    you = email

    msg = MIMEMultipart('alternative')
    msg['Subject'] = "Hi there"
    msg['From'] = me
    msg['To'] = you

    html = '<html><body><p>Your request has been received. Your folio is '+ folio +'</p></body></html>'
    part2 = MIMEText(html, 'html')

    msg.attach(part2)

    s = smtplib.SMTP_SSL('smtp.gmail.com')
    
    s.login(me, my_password)
    s.sendmail(me, you, msg.as_string())
    s.quit()

    return {"success": True}

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port = 8000)
