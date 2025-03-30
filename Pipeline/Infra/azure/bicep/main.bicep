
param location string = 'australiaeast'
param prefix string = 'matoa'

module storage 'modules/storage.bicep' = {
  name: 'storageDeployment'
  params: {
    location: location
    prefix: prefix
  }
}

module sql 'modules/sql.bicep' = {
  name: 'sqlDeployment'
  params: {
    location: location
    prefix: prefix
  }
}

module keyvault 'modules/keyvault.bicep' = {
  name: 'keyVaultDeployment'
  params: {
    location: location
    prefix: prefix
    sqlAdminPassword: sql.outputs.sqlAdminPassword
    sqlConnectionString: sql.outputs.connectionString
  }
}

module frontend 'modules/appservice.bicep' = {
  name: 'frontendDeployment'
  params: {
    location: location
    prefix: prefix
    nameSuffix: 'website'
  }
}

module backend 'modules/appservice.bicep' = {
  name: 'backendDeployment'
  params: {
    location: location
    prefix: prefix
    nameSuffix: 'service'
  }
}
