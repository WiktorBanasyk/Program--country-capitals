import json

# Ścieżka do pliku JSON wejściowego i wyjściowego
input_file_path = 'path/to/your/input_file.json'  # Zmień na rzeczywistą ścieżkę
output_file_path = 'path/to/your/output_file.json'  # Zmień na rzeczywistą ścieżkę

# Wczytaj dane z pliku JSON
with open(input_file_path, 'r') as input_file:
    json_data = json.load(input_file)

# Przygotuj nową tablicę danych
new_data = []

# Iteruj po elementach w tablicy 'data'
for item in json_data['data']:
    # Sprawdź, czy 'CERT_NAME' nie jest pusty
    if item['CERT_NAME'].strip():  # Sprawdzanie, czy jest niepusty
        new_data.append({
            "CERT_NAME": item['CERT_NAME']
        })

# Przygotuj nowy słownik JSON
new_json = {
    "data": new_data
}

# Zapisz nowy plik JSON
with open(output_file_path, 'w') as output_file:
    json.dump(new_json, output_file, indent=4)

print(f'Sukces: Utworzono plik JSON z {len(new_data)} elementami.')
==========
import json

# Ścieżka do pliku JSON wejściowego i wyjściowego
input_file_path = 'path/to/your/input_file.json'  # Zmień na rzeczywistą ścieżkę
output_file_path = 'serwery.json'  # Plik wynikowy, gdzie zapiszemy dane

# Wczytaj dane z pliku JSON
with open(input_file_path, 'r') as input_file:
    json_data = json.load(input_file)

# Lista na elementy zawierające 'slp' lub 'swp' w 'CERT_NAME'
filtered_data = []

# Iteruj po elementach w tablicy 'data'
for item in json_data['data']:
    # Wypisz wszystkie klucze i wartości elementu
    print("Element:")
    for key, value in item.items():
        print(f"{key}: {value}")

    # Sprawdź, czy w 'CERT_NAME' jest fraza 'slp' lub 'swp'
    cert_name = item['CERT_NAME'].strip().lower()
    if 'slp' in cert_name or 'swp' in cert_name:
        print("\n---> Ten element zawiera 'slp' lub 'swp' w 'CERT_NAME':")
        for key, value in item.items():
            print(f"{key}: {value}")
        # Dodaj ten element do listy wynikowej
        filtered_data.append(item)
    print("-" * 30)  # Dodanie separatora dla czytelności

# Zapisz wyfiltrowane elementy do nowego pliku JSON
with open(output_file_path, 'w') as output_file:
    json.dump({"data": filtered_data}, output_file, indent=4)

print(f'Sukces: Utworzono plik {output_file_path} zawierający {len(filtered_data)} elementy.')
