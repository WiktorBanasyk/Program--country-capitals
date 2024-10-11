import csv
import json
import subprocess

# Step 1: Run your existing Bash script to clean the CSV file (modifies the file in place)
bash_script = './clean_csv.sh'  # Change this to the path of your Bash script
subprocess.run(bash_script, shell=True, check=True)

# Step 2: Define the original CSV file and output JSON file
csv_file_path = 'certs_warn_5.log'  # The original CSV file, which is modified in place
json_file_path = 'certs_warn_5.json'  # The file where JSON output will be stored

# Step 3: Read the cleaned CSV and convert it to JSON
data = []
with open(csv_file_path, mode='r') as csv_file:
    csv_reader = csv.DictReader(csv_file)  # Reads CSV as dictionaries
    for row in csv_reader:
        data.append(row)

# Step 4: Write the data to a JSON file
with open(json_file_path, mode='w') as json_file:
    json.dump(data, json_file, indent=4)

print(f"CSV file '{csv_file_path}' successfully converted to JSON as '{json_file_path}'")
