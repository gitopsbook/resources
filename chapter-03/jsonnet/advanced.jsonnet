function(prod=false) {                    # A, B 
   "apiVersion": "apps/v1",
   "kind": "Deployment",
   "metadata": {
      "name": "nginx"
   },
   "spec": {
      "selector": {
         "matchLabels": {
            "app": $.metadata.name        # C
         }
      },
      "replicas": if prod then 10 else 1, # D
      "template": {
         "metadata": {
            "labels": {
               "app": $.metadata.name
            }
         },
         "spec": {
            "containers": [
               {
                  "name": $.metadata.name,
                  "image": "nginx:1.14.2",
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
