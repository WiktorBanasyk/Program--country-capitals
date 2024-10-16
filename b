fdsfsf
import csv
import json

def csv_to_json_custom(csv_file, json_file):
    data = []
    
    # Otwieramy plik CSV i wczytujemy dane
    with open(csv_file, mode='r', encoding='utf-8') as file:
        csv_reader = csv.reader(file)
        
        # Iterujemy przez każdą linię CSV
        for row in csv_reader:
            if len(row) > 0:
                # Podział na dwie części: data_hash i lista dat
                date_hash, date_list_str = row[0].split(' ', 1)
                
                # Usuwamy niepotrzebne znaki z listy, takie jak nawiasy kwadratowe i cudzysłowy
                date_list_str = date_list_str.strip("[]").replace("'", "").replace('"', '')
                
                # Tworzymy listę z poszczególnych dat
                date_list = [date.strip() for date in date_list_str.split(',')]
                
                # Dodajemy obiekt do listy, gdzie klucz to data_hash, a wartość to lista dat
                data.append({date_hash: date_list})
    
    # Zapisujemy dane do pliku JSON
    with open(json_file, mode='w', encoding='utf-8') as file:
        json.dump(data, file, indent=4)

# Przykład użycia
csv_file = 'input.csv'  # Ścieżka do pliku CSV
json_file = 'output.json'  # Ścieżka do zapisu pliku JSON

csv_to_json_custom(csv_file, json_file)
