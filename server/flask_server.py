from flask import Flask, request, jsonify
import os

UPLOAD_FOLDER = os.path.expanduser("~/storage/downloads/natsuko/server/uploads")
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

app = Flask(__name__)

@app.route("/upload", methods=["POST"])
def upload():
    if request.is_json:
        data = request.get_json()
        filename = request.args.get("filename", "uploaded.json")
        path = os.path.join(UPLOAD_FOLDER, filename)
        with open(path, "w", encoding="utf-8") as f:
            import json
            json.dump(data, f, ensure_ascii=False, indent=2)
        return jsonify({"status": "success", "file": filename}), 200
    return jsonify({"status": "error", "message": "Expected JSON"}), 400

if __name__ == "__main__":
    app.run(port=8080)
