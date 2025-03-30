
param location string
param prefix string
param sqlAdminPassword string
param sqlConnectionString string

resource kv 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: '${prefix}-kv'
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: []
    enabledForDeployment: true
    enabledForTemplateDeployment: true
  }
}

resource sqlSecret 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  name: '${kv.name}/sql-password'
  properties: {
    value: sqlAdminPassword
  }
}

resource connSecret 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  name: '${kv.name}/sql-connection'
  properties: {
    value: sqlConnectionString
  }
}
