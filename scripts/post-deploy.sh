#!/bin/bash
echo "🚀 Script de post-déploiement..."

# Récupération des IPs
ANSIBLE_IP=$(terraform output -raw ansible-tm_public_ip)
WEB_IP=$(terraform output -raw web-apache-tm_public_ip)

# Test de connectivité
echo "🔍 Test de connectivité..."
curl -s http://$WEB_IP > /dev/null && echo "✅ Site web accessible" || echo "❌ Site web inaccessible"

# Génération du QR code
if command -v qrencode &> /dev/null; then
    qrencode -t PNG -o web-qr.png "http://$WEB_IP"
    echo "📱 QR code généré: web-qr.png"
fi

echo "🎉 Post-déploiement terminé !"
