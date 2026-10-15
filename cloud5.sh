export RG="cloud5-lab-rg"
export REGION="germanywestcentral"
export ACCT="cloud5lab$RANDOM"

az group create --name $RG --location $REGION

az storage account create --name $ACCT --resource-group $RG --location $REGION --sku Standard_LRS

export KEY=$(az storage account keys list -g $RG -n $ACCT --query "[0].value" -o tsv)

az storage container create --name private-data --account-name $ACCT --account-key $KEY

echo "YoMomaIsSoVadammtFadd" > secret.txt

az storage blob upload --account-name $ACCT --account-key $KEY \
  --container-name private-data --name secret.txt --file secret.txt

az storage blob download --account-name $ACCT --account-key $KEY \
  --container-name private-data --name secret.txt --file secret-downloaded.txt

az storage blob upload --account-name $ACCT --account-key $KEY \
  --container-name private-data --name memo.txt --file secret.txt

az storage blob delete --account-name $ACCT --account-key $KEY \
  --container-name private-data --name memo.txt

az storage blob list --account-name $ACCT --account-key $KEY \
  --container-name private-data --query "[].name" -o tsv

az storage blob set-tier --account-name $ACCT --account-key $KEY \
  --container-name private-data --name secret.txt --tier Cool

az storage blob show --account-name $ACCT --account-key $KEY \
  --container-name private-data --name secret.txt --query "properties.blobTier" -o tsv

az storage blob set-tier --account-name $ACCT --account-key $KEY \
  --container-name private-data --name secret.txt --tier Hot

export URL="https://$ACCT.blob.core.windows.net/private-data/secret.txt"
export EXPIRY=$(date -u -d "15 minutes" '+%Y-%m-%dT%H:%MZ')

export SAS=$(az storage blob generate-sas --account-name $ACCT --account-key $KEY \
  --container-name private-data --name secret.txt \
  --permissions r --expiry $EXPIRY --https-only --output tsv)

curl -s "$URL?$SAS"

az storage account update --name $ACCT --resource-group $RG --allow-blob-public-access true

az storage container set-permission --name private-data --account-name $ACCT --account-key $KEY --public-access container

az storage account update --name $ACCT --resource-group $RG --allow-blob-public-access false

az storage container set-permission \
  --name private-data \
  --account-name "$ACCT" \
  --account-key "$KEY" \
  --public-access off

az storage account update \
  --name "$ACCT" \
  --resource-group "$RG" \
  --allow-blob-public-access false

export PG_NAME="cloud5pg$RANDOM"
export PG_ADMIN="dbadmin"
export PG_PASS="Cl0ud5Lab!$RANDOM"

az postgres flexible-server create \
  --resource-group $RG \
  --name $PG_NAME \
  --location westeurope \
  --admin-user $PG_ADMIN \
  --admin-password "$PG_PASS" \
  --sku-name Standard_D2s_v3 \
  --tier GeneralPurpose \
  --version 16 \
  --storage-size 32 \
  --public-access None \
  --yes

# Wenn permission error:
az provider register \
  --namespace Microsoft.DBforPostgreSQL \
  --wait

export MY_IP=$(curl -s https://api.ipify.org)

az postgres flexible-server firewall-rule create \
  --resource-group $RG \
  --name $PG_NAME \
  --rule-name allow-my-ip \
  --start-ip-address $MY_IP \
  --end-ip-address $MY_IP

az postgres flexible-server show \
  --resource-group $RG \
  --name $PG_NAME \
  --query "{name:name, state:state, version:version, fqdn:fullyQualifiedDomainName}" \
  -o table

export PG_HOST=$(az postgres flexible-server show \
  --resource-group $RG --name $PG_NAME \
  --query "fullyQualifiedDomainName" -o tsv)

echo "Host:     $PG_HOST"
echo "Port:     5432"
echo "Database: postgres"
echo "Username: $PG_ADMIN"
echo "Password: (the value of \$PG_PASS you set above)"

export PGSSLMODE=require
psql "host=$PG_HOST port=5432 dbname=postgres user=$PG_ADMIN password=$PG_PASS" \
  -c "SELECT version();"

# A real table round-trip
psql "host=$PG_HOST port=5432 dbname=postgres user=$PG_ADMIN password=$PG_PASS" -c \
  "CREATE TABLE demo (id serial primary key, note text);
   INSERT INTO demo (note) VALUES ('connected from the CLOUD 5 lab');
   SELECT * FROM demo;"

az group delete --name $RG --yes --no-wait