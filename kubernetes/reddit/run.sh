kubectl apply -f ./dev-namespace.yml
kubectl apply -n dev -f ./comment-deployment.yml
kubectl apply -n dev -f ./comment-mongodb-service.yml
kubectl apply -n dev -f ./comment-service.yml
kubectl apply -n dev -f ./mongo-deployment.yml
kubectl apply -n dev -f ./post-deployment.yml
kubectl apply -n dev -f ./post-mongodb-service.yml
kubectl apply -n dev -f ./post-service.yml
kubectl apply -n dev -f ./ui-deployment.yml
kubectl apply -n dev -f ./ui-service.yml
