# 🔧 Guide de dépannage

## Problèmes courants

### ❌ Terraform apply échoue

**Symptôme** : Error during apply
**Solution** :

```bash
terraform refresh
terraform plan
terraform apply
```

### ❌ SSH Connection refused

**Symptôme** : Cannot connect via SSH
**Solution** :

1. Vérifier le Security Group
2. Attendre 2-3 minutes après création
3. Vérifier la clé SSH

### ❌ Apache non accessible

**Commandes de diagnostic** :

```bash
ssh -i ~/.ssh/id_rsa admin@IP_WEB
sudo systemctl status apache2
sudo netstat -tlnp | grep :80
sudo tail -f /var/log/apache2/error.log
```
