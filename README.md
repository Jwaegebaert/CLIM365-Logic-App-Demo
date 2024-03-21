# Execute a CLI for Microsoft 365 script from a Logic App

This repository contains a demo script that can be quickly rebuilt in your environment using the `LogicApp.json` file. 

## Setup

1. Create a User Assigned Managed Identity with sufficient permissions to execute this script. For the demo script included in this repository, the "Sites.Read.All" permission from the SharePoint resource should suffice.

You can assign permissions using the following command:

```bash
m365 entra approleassignment add --appDisplayName "Identity-Name" --resource "SharePoint" --scopes "Sites.Read.All"
```

2. Ensure that this User Assigned Managed Identity is also assigned to your Logic App.

## Testing

To test this Logic App, copy the "HTTP Post URL" provided by the "When a HTTP request is received" trigger and send a request to it.