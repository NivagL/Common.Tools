
param location string
param prefix string
param nameSuffix string

resource plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${prefix}-plan'
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  properties: {
    reserved: true
  }
}

resource app 'Microsoft.Web/sites@2022-03-01' = {
  name: '${prefix}-${nameSuffix}'
  location: location
  properties: {
    serverFarmId: plan.id
    httpsOnly: true
  }
}
