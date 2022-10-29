kubectl apply -f dev-namespace.yml

. ./install-ingress.sh

kubectl apply -n dev -f comment-deployment.yml
kubectl apply -n dev -f comment-mongodb-service.yml
kubectl apply -n dev -f comment-service.yml
kubectl apply -n dev -f mongo-deployment.yml
kubectl apply -n dev -f mongo-service.yml
kubectl apply -n dev -f post-deployment.yml
kubectl apply -n dev -f post-mongodb-service.yml
kubectl apply -n dev -f post-service.yml
kubectl apply -n dev -f ui-deployment.yml
kubectl apply -n dev -f ui-ingress.yml
kubectl apply -n dev -f ui-service.yml
