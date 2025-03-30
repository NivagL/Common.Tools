
param location string
param prefix string

@secure()
var sqlAdminPassword = newGuid()

resource sqlServer 'Microsoft.Sql/servers@2022-02-01-preview' = {
  name: '${prefix}-sql'
  location: location
  properties: {
    administratorLogin: 'sqladminuser'
    administratorLoginPassword: sqlAdminPassword
  }
}

resource database 'Microsoft.Sql/servers/databases@2022-02-01-preview' = {
  name: '${sqlServer.name}/${prefix}-database'
  properties: {
    autoPauseDelay: 60
    computeModel: 'Serverless'
    minCapacity: 0.5
    maxSizeBytes: 5368709120
    zoneRedundant: false
  }
  sku: {
    name: 'GP_S_Gen5_1'
    tier: 'GeneralPurpose'
  }
}

output connectionString string = ''
output sqlAdminPassword string = sqlAdminPassword
