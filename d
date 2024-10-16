sed -n '1h;1!H;${g;s/.*"certificates":\s*\[\([^]]*\)\].*/\1/;s/"EXPIRE":\s*"\([^"]*\)"/{"{#CERT_EXPIRE}": "\1"}/gp}' test.json | sed '1s/^/{\n  "data": [\n/; $s/$/\n  ]\n}/'
jq -r '{
    data: [.certificates[] | {"{#CERT_EXPIRE}": .EXPIRE}]
}' test.json > output.json

jq -r '{ data: [.certificates[] | {"{#CERT_EXPIRE}": .EXPIRE}] }' test2.json > test3.json # przeksztalcenie kluczy na {#CERT_EXPIRE}
