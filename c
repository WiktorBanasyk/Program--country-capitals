import csv
import json

def csv_to_json(csv_file, json_file):
    data = {"certificates": []}  # Tworzymy pustą strukturę do przechowywania danych

    # Otwieramy plik CSV
    with open(csv_file, mode='r', encoding='utf-8') as file:
        reader = csv.reader(file)
        
        # Przetwarzamy każdą linię CSV
        for row in reader:
            # Zakładam, że każda linia ma tylko jeden element: 'data_hash'
            if row:  # Sprawdzamy, czy linia nie jest pusta
                certificate = {
                    "expire5": row[0]  # Wstawiamy wartość z CSV do pola "expire5"
                }
                data["certificates"].append(certificate)  # Dodajemy nowy certyfikat do listy

    # Zapisujemy dane do pliku JSON
    with open(json_file, mode='w', encoding='utf-8') as file:
        json.dump(data, file, indent=4, ensure_ascii=False)  # Zapisujemy w formacie JSON

# Przykład użycia
csv_file = 'certificates.csv'  # Plik wejściowy CSV
json_file = 'certificates.json'  # Plik wyjściowy JSON

csv_to_json(csv_file, json_file)
