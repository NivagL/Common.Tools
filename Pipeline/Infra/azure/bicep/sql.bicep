
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

output connectionString string = 'Server=tcp:${sqlServer.name}.database.windows.net,1433;Initial Catalog=${prefix}-database;Persist Security Info=False;User ID=sqladminuser;Password=${sqlAdminPassword};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;'
output sqlAdminPassword string = sqlAdminPassword
