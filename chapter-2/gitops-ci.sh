export VERSION=$(git rev-parse HEAD | cut -c1-7)                #A
make build                                                      #B
make test

export NEW_IMAGE="acme.com/guestbook:${VERSION}"                #C
docker build -t ${NEW_IMAGE} .
docker push ${NEW_IMAGE}

git clone http://github.com/acme.com/guestbook.git              #D
cd guestbook

kubectl patch \                                                 #E
  --local \
  -o yaml \
  -f guestbook.yaml \
  -p "spec:
        template:
          spec:
            containers:
            - name: guestbook
              image: ${NEW_IMAGE}" \
  > /tmp/newguestbook.yaml
mv /tmp/newguestbook.yaml guestbook.yaml

git add . -m "Update guestbook to ${NEW_IMAGE}"                 #F
git push

