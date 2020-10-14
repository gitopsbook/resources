local name = "nginx";
local version = "1.14.2";
local replicas = 2;
{
   "apiVersion": "apps/v1",
   "kind": "Deployment",
   "metadata": {
      "name": name
   },
   "spec": {
      "selector": {
         "matchLabels": {
            "app": name
         }
      },
      "replicas": replicas,
      "template": {
         "metadata": {
            "labels": {
               "app": name
            }
         },
         "spec": {
            "containers": [
               {
                  "name": name,
                  "image": "nginx:" + version,
                  "ports": [
                     {
                        "containerPort": 80
                     }
                  ]
               }
            ]
         }
      }
   }
}